$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot

$skillsRoot = Join-Path $repoRoot "skills"
$resourcesRoot = Join-Path $repoRoot "resources"
$docsRoot = Join-Path $repoRoot "docs"
$testsRoot = Join-Path $repoRoot "tests"

$script:validationErrors = @()

function Add-ValidationError {

    param(
        [string]$Message
    )

    $script:validationErrors += $Message
}

function Resolve-RelativePath {

    param(
        [string]$BasePath,
        [string]$RelativePath
    )

    $resolved = $BasePath

    foreach ($segment in ($RelativePath -split '[\\/]')) {

        if (-not [string]::IsNullOrWhiteSpace($segment)) {

            $resolved = Join-Path `
                $resolved `
                $segment
        }
    }

    return $resolved
}


function Get-NormalizedTextFingerprint {

    param(
        [string]$Path
    )

    $text = [IO.File]::ReadAllText($Path)

    $normalized = $text.Replace(
        "`r`n",
        "`n"
    ).Replace(
        "`r",
        "`n"
    )

    $encoding = [System.Text.UTF8Encoding]::new(
        $false
    )

    $bytes = $encoding.GetBytes(
        $normalized
    )

    $sha256 = [System.Security.Cryptography.SHA256]::Create()

    try {

        $hashBytes = $sha256.ComputeHash(
            $bytes
        )
    }
    finally {

        $sha256.Dispose()
    }

    return [PSCustomObject]@{
        Bytes  = $bytes.Length
        SHA256 = [Convert]::ToHexString($hashBytes)
    }
}
function Test-SameFile {

    param(
        [string]$Source,
        [string]$Destination,
        [string]$Label
    )

    if (-not (Test-Path $Source)) {
        Add-ValidationError "Missing source file: $Label"
        return
    }

    if (-not (Test-Path $Destination)) {
        Add-ValidationError "Missing generated file: $Label"
        return
    }

    $sourceHash = (
        Get-FileHash `
            -LiteralPath $Source `
            -Algorithm SHA256
    ).Hash

    $destinationHash = (
        Get-FileHash `
            -LiteralPath $Destination `
            -Algorithm SHA256
    ).Hash

    if ($sourceHash -ne $destinationHash) {
        Add-ValidationError "Generated file is stale: $Label"
    }
}

$expectedSkills = @(
    "advanced-motion",
    "asset-direction",
    "creative-direction",
    "design-system-web",
    "extract-design-system",
    "frontend-accessibility",
    "frontend-architecture",
    "frontend-master",
    "frontend-performance",
    "frontend-resource-intelligence",
    "frontend-ui-engineering",
    "interface-polish",
    "redesign-existing-projects",
    "responsive-composition",
    "shadcn-integration",
    "visual-qa",
    "visual-reference-to-code",
    "web-3d"
)

$skillDirectories = @(
    Get-ChildItem `
        -Path $skillsRoot `
        -Directory |
        Sort-Object Name
)

$actualSkillNames = @(
    $skillDirectories |
    Select-Object -ExpandProperty Name
)

$missingSkills = @(
    $expectedSkills |
    Where-Object {
        $_ -notin $actualSkillNames
    }
)

$unexpectedSkills = @(
    $actualSkillNames |
    Where-Object {
        $_ -notin $expectedSkills
    }
)

$missingSkills |
    ForEach-Object {
        Add-ValidationError "Missing canonical skill directory: $_"
    }

$unexpectedSkills |
    ForEach-Object {
        Add-ValidationError "Unexpected canonical skill directory: $_"
    }

$validationRows = @()

$totalDescriptionLength = 0

foreach ($skillName in $expectedSkills) {

    $skillDirectory = Join-Path `
        $skillsRoot `
        $skillName

    $skillFile = Join-Path `
        $skillDirectory `
        "SKILL.md"

    if (-not (Test-Path $skillFile)) {

        Add-ValidationError "$skillName is missing SKILL.md."

        continue
    }

    $content = Get-Content `
        -Path $skillFile `
        -Raw

    $nameMatch = [regex]::Match(
        $content,
        '(?m)^name:\s*(.+?)\s*$'
    )

    $descriptionMatch = [regex]::Match(
        $content,
        '(?m)^description:\s*(.+?)\s*$'
    )

    $frontmatterName = ""

    $description = ""

    if ($nameMatch.Success) {
        $frontmatterName = $nameMatch.Groups[1].Value.Trim()
    }
    else {
        Add-ValidationError "$skillName has no name frontmatter."
    }

    if ($descriptionMatch.Success) {
        $description = $descriptionMatch.Groups[1].Value.Trim()
    }
    else {
        Add-ValidationError "$skillName has no description frontmatter."
    }

    if (
        -not [string]::IsNullOrWhiteSpace($frontmatterName) -and
        $frontmatterName -ne $skillName
    ) {
        Add-ValidationError "$skillName has mismatched frontmatter name '$frontmatterName'."
    }

    if ([string]::IsNullOrWhiteSpace($description)) {
        Add-ValidationError "$skillName has an empty description."
    }

    if ($description.Length -gt 240) {
        Add-ValidationError "$skillName description is too long: $($description.Length) characters."
    }

    $totalDescriptionLength += $description.Length

    if (
        $content -match
        '(?m)^disable-model-invocation:\s*true\s*$'
    ) {
        Add-ValidationError "$skillName disables model invocation."
    }

    $referenceMatches = @(
        [regex]::Matches(
            $content,
            'references/[A-Za-z0-9._/-]+\.md'
        ) |
        ForEach-Object {
            $_.Value
        } |
        Sort-Object -Unique
    )

    foreach ($reference in $referenceMatches) {

        $referencePath = Resolve-RelativePath `
            -BasePath $skillDirectory `
            -RelativePath $reference

        if (-not (Test-Path $referencePath)) {
            Add-ValidationError "$skillName references missing file: $reference"
        }
    }

    $validationRows += [PSCustomObject]@{
        Skill             = $skillName
        DescriptionLength = $description.Length
        References        = $referenceMatches.Count
    }
}

if ($totalDescriptionLength -gt 5000) {
    Add-ValidationError "Total description budget exceeds 5000 characters: $totalDescriptionLength"
}

$skillFiles = @(
    Get-ChildItem `
        -Path $skillsRoot `
        -Filter "SKILL.md" `
        -File `
        -Recurse
)

if ($skillFiles.Count -ne 18) {
    Add-ValidationError "Expected 18 SKILL.md files but found $($skillFiles.Count)."
}

$skillPlaceholders = @(
    Get-ChildItem `
        -Path $skillsRoot `
        -Filter ".gitkeep" `
        -File `
        -Recurse `
        -ErrorAction SilentlyContinue
)

if ($skillPlaceholders.Count -gt 0) {
    Add-ValidationError "Found stale .gitkeep files under canonical skill folders."
}

# ------------------------------------------------------------
# Resource catalog checks
# ------------------------------------------------------------

$catalogCsv = Join-Path `
    $resourcesRoot `
    "catalog.csv"

$catalogJson = Join-Path `
    $resourcesRoot `
    "catalog.json"

if (-not (Test-Path $catalogCsv)) {
    Add-ValidationError "resources/catalog.csv is missing."
}

if (-not (Test-Path $catalogJson)) {
    Add-ValidationError "resources/catalog.json is missing."
}

$csvCount = 0
$jsonCount = 0

if (Test-Path $catalogCsv) {

    $csvRows = @(
        Import-Csv $catalogCsv
    )

    $csvCount = $csvRows.Count
}

if (Test-Path $catalogJson) {

    $jsonRows = @(
        Get-Content `
            -Path $catalogJson `
            -Raw |
        ConvertFrom-Json
    )

    $jsonCount = $jsonRows.Count
}

if ($csvCount -ne $jsonCount) {
    Add-ValidationError "Resource CSV/JSON count mismatch: CSV=$csvCount JSON=$jsonCount"
}

if ($csvCount -eq 0) {
    Add-ValidationError "Resource catalog is empty."
}

# ------------------------------------------------------------
# Generated resource bundle checks
# ------------------------------------------------------------

$resourceSkillRoot = Join-Path `
    $skillsRoot `
    "frontend-resource-intelligence"

$resourceSkillReferences = Join-Path `
    $resourceSkillRoot `
    "references"

Test-SameFile `
    -Source $catalogCsv `
    -Destination (
        Join-Path `
            $resourceSkillReferences `
            "catalog.csv"
    ) `
    -Label "resource catalog.csv"

Test-SameFile `
    -Source $catalogJson `
    -Destination (
        Join-Path `
            $resourceSkillReferences `
            "catalog.json"
    ) `
    -Label "resource catalog.json"

$resourcePolicy = Join-Path `
    $docsRoot `
    "RESOURCE_POLICY.md"

Test-SameFile `
    -Source $resourcePolicy `
    -Destination (
        Join-Path `
            $resourceSkillReferences `
            "RESOURCE_POLICY.md"
    ) `
    -Label "resource policy"

$generatedCatalogRoot = Join-Path `
    $resourceSkillReferences `
    "catalog"

$categoryDirectories = @(
    Get-ChildItem `
        -Path $resourcesRoot `
        -Directory
)

foreach ($categoryDirectory in $categoryDirectories) {

    Get-ChildItem `
        -Path $categoryDirectory.FullName `
        -File `
        -Recurse |
        ForEach-Object {

            $relative = [IO.Path]::GetRelativePath(
                $resourcesRoot,
                $_.FullName
            )

            $destination = Resolve-RelativePath `
                -BasePath $generatedCatalogRoot `
                -RelativePath $relative

            Test-SameFile `
                -Source $_.FullName `
                -Destination $destination `
                -Label "resource/$relative"
        }
}

# ------------------------------------------------------------
# Resource manifest integrity
# ------------------------------------------------------------

$manifestPath = Join-Path `
    $resourceSkillReferences `
    "MANIFEST.csv"

if (-not (Test-Path $manifestPath)) {

    Add-ValidationError "Resource MANIFEST.csv is missing."
}
else {

    $manifestRows = @(
        Import-Csv $manifestPath
    )

    $actualGeneratedFiles = @(
        Get-ChildItem `
            -Path $resourceSkillReferences `
            -File `
            -Recurse |
        Where-Object {
            $_.FullName -ne $manifestPath
        }
    )

    if ($manifestRows.Count -ne $actualGeneratedFiles.Count) {

        Add-ValidationError "Resource manifest file count mismatch."
    }

    foreach ($manifestRow in $manifestRows) {

        $filePath = Resolve-RelativePath `
            -BasePath $resourceSkillReferences `
            -RelativePath $manifestRow.RelativePath

        if (-not (Test-Path $filePath)) {

            Add-ValidationError "Manifest references missing file: $($manifestRow.RelativePath)"

            continue
        }

        $fingerprint = Get-NormalizedTextFingerprint `
            -Path $filePath

        if ([long]$manifestRow.Bytes -ne $fingerprint.Bytes) {
            Add-ValidationError "Manifest byte mismatch: $($manifestRow.RelativePath)"
        }

        if ($manifestRow.SHA256 -ne $fingerprint.SHA256) {
            Add-ValidationError "Manifest hash mismatch: $($manifestRow.RelativePath)"
        }
    }
}

# ------------------------------------------------------------
# Generated skill registry checks
# ------------------------------------------------------------

$registryPath = Resolve-RelativePath `
    -BasePath $skillsRoot `
    -RelativePath "frontend-master/references/generated-skill-registry.md"

if (-not (Test-Path $registryPath)) {

    Add-ValidationError "Generated skill registry is missing."
}
else {

    $registryContent = Get-Content `
        -Path $registryPath `
        -Raw

    foreach ($row in $validationRows) {

        $skillFile = Join-Path `
            (Join-Path $skillsRoot $row.Skill) `
            "SKILL.md"

        $skillContent = Get-Content `
            -Path $skillFile `
            -Raw

        $descriptionMatch = [regex]::Match(
            $skillContent,
            '(?m)^description:\s*(.+?)\s*$'
        )

        $description = $descriptionMatch.Groups[1].Value.Trim()

        $description = $description.Replace(
            "|",
            "\|"
        )

        $expectedRegistryRow = "| $($row.Skill) | $description |"

        if (-not $registryContent.Contains($expectedRegistryRow)) {
            Add-ValidationError "Generated registry is stale for $($row.Skill)."
        }
    }
}

# ------------------------------------------------------------
# Routing case checks
# ------------------------------------------------------------

$routingCasesPath = Join-Path `
    $testsRoot `
    "routing-cases.csv"

if (-not (Test-Path $routingCasesPath)) {

    Add-ValidationError "tests/routing-cases.csv is missing."
}
else {

    $routingCases = @(
        Import-Csv $routingCasesPath
    )

    if ($routingCases.Count -lt 18) {
        Add-ValidationError "Expected at least 18 routing eval cases."
    }

    $duplicateIds = @(
        $routingCases |
        Group-Object id |
        Where-Object {
            $_.Count -gt 1
        }
    )

    if ($duplicateIds.Count -gt 0) {
        Add-ValidationError "Routing eval case IDs are not unique."
    }

    foreach ($case in $routingCases) {

        if ([string]::IsNullOrWhiteSpace($case.prompt)) {
            Add-ValidationError "Routing case $($case.id) has no prompt."
        }

        if ($case.expected_primary -notin $expectedSkills) {
            Add-ValidationError "Routing case $($case.id) references unknown skill '$($case.expected_primary)'."
        }
    }
}

# ------------------------------------------------------------
# Required repository files
# ------------------------------------------------------------

$requiredRepositoryFiles = @(
    "README.md",
    "LICENSE",
    "NOTICE.md",
    "CONTRIBUTING.md",
    ".gitattributes",
    "scripts/setup.ps1",
    "docs/ARCHITECTURE.md",
    "docs/INSTALLATION.md",
    "docs/DISTRIBUTION.md",
    "tests/README.md",
    "tests/routing-cases.csv",
    ".github/workflows/validate.yml"
)

foreach ($relativeFile in $requiredRepositoryFiles) {

    $fullPath = Resolve-RelativePath `
        -BasePath $repoRoot `
        -RelativePath $relativeFile

    if (-not (Test-Path $fullPath)) {
        Add-ValidationError "Required repository file missing: $relativeFile"
    }
}

# ------------------------------------------------------------
# Output
# ------------------------------------------------------------

Write-Host ""
Write-Host "=== Skill Validation ==="
Write-Host ""

$validationRows |
    Sort-Object Skill |
    Format-Table -AutoSize

Write-Host ""
Write-Host "Skill count: $($validationRows.Count)"
Write-Host "Description characters: $totalDescriptionLength"
Write-Host "Resource records: $csvCount"
Write-Host "Validation errors: $($script:validationErrors.Count)"

$script:validationErrors |
    ForEach-Object {
        Write-Host "ERROR: $_"
    }

if ($script:validationErrors.Count -gt 0) {
    throw "Repository validation failed."
}

Write-Host ""
Write-Host "PASS: Repository validation passed."
