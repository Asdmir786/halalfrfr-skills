$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$configPath = Join-Path $repoRoot "config/skill-set.json"

$validationErrors = @()

function Add-ValidationError {
    param([string]$Message)

    $script:validationErrors += $Message
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

    $encoding = [System.Text.UTF8Encoding]::new($false)
    $bytes = $encoding.GetBytes($normalized)

    $sha256 = [System.Security.Cryptography.SHA256]::Create()

    try {
        $hashBytes = $sha256.ComputeHash($bytes)
    }
    finally {
        $sha256.Dispose()
    }

    return [PSCustomObject]@{
        Bytes = $bytes.Length
        SHA256 = [Convert]::ToHexString($hashBytes)
    }
}

if (-not (Test-Path $configPath)) {
    throw "Missing config/skill-set.json"
}

$config = Get-Content `
    $configPath `
    -Raw |
    ConvertFrom-Json

$expectedSkills = @(
    $config.skills |
    ForEach-Object {
        $_.name
    }
)

$actualSkills = @(
    Get-ChildItem `
        (Join-Path $repoRoot "skills") `
        -Directory |
    Select-Object -ExpandProperty Name |
    Sort-Object
)

$missingSkills = @(
    $expectedSkills |
    Where-Object {
        $_ -notin $actualSkills
    }
)

$extraSkills = @(
    $actualSkills |
    Where-Object {
        $_ -notin $expectedSkills
    }
)

$missingSkills |
    ForEach-Object {
        Add-ValidationError "Missing canonical skill: $_"
    }

$extraSkills |
    ForEach-Object {
        Add-ValidationError "Unexpected skill directory: $_"
    }

if ($expectedSkills.Count -ne 28) {
    Add-ValidationError "Expected canonical inventory to contain 28 skills."
}

$skillRows = @()
$totalDescriptionCharacters = 0

foreach ($skillName in $expectedSkills) {

    $skillDir = Join-Path `
        $repoRoot `
        "skills/$skillName"

    $skillFile = Join-Path `
        $skillDir `
        "SKILL.md"

    if (-not (Test-Path $skillFile)) {
        continue
    }

    $content = Get-Content `
        $skillFile `
        -Raw

    $nameMatch = [regex]::Match(
        $content,
        '(?m)^name:\s*(.+?)\s*$'
    )

    $descriptionMatch = [regex]::Match(
        $content,
        '(?m)^description:\s*(.+?)\s*$'
    )

    if (-not $nameMatch.Success) {
        Add-ValidationError "Missing frontmatter name: $skillName"
        continue
    }

    if ($nameMatch.Groups[1].Value.Trim() -ne $skillName) {
        Add-ValidationError "Frontmatter name mismatch: $skillName"
    }

    if (-not $descriptionMatch.Success) {
        Add-ValidationError "Missing description: $skillName"
        continue
    }

    $description = $descriptionMatch.Groups[1].Value.Trim()
    $descriptionLength = $description.Length

    $totalDescriptionCharacters += $descriptionLength

    if ($descriptionLength -gt 240) {
        Add-ValidationError "Description exceeds 240 chars: $skillName"
    }

    if ($content -match '(?mi)^disable-model-invocation:\s*true\s*$') {
        Add-ValidationError "disable-model-invocation true is not allowed: $skillName"
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

    foreach ($relativeReference in $referenceMatches) {

        $referencePath = Join-Path `
            $skillDir `
            ($relativeReference.Replace(
                "/",
                [IO.Path]::DirectorySeparatorChar
            ))

        if (-not (Test-Path $referencePath)) {
            Add-ValidationError "Missing referenced file: $skillName/$relativeReference"
        }
    }

    $skillRows += [PSCustomObject]@{
        Skill = $skillName
        DescriptionLength = $descriptionLength
        References = $referenceMatches.Count
    }
}

if ($totalDescriptionCharacters -gt 5000) {
    Add-ValidationError "Total description budget exceeds 5000 characters: $totalDescriptionCharacters"
}

$gitkeeps = @(
    Get-ChildItem `
        (Join-Path $repoRoot "skills") `
        -Filter ".gitkeep" `
        -File `
        -Recurse
)

if ($gitkeeps.Count -gt 0) {
    Add-ValidationError "Canonical skill folders contain .gitkeep files."
}

$requiredFiles = @(
    ".gitattributes",
    ".gitignore",
    "README.md",
    "LICENSE",
    "NOTICE.md",
    "CONTRIBUTING.md",
    "config/skill-set.json",
    ".github/workflows/validate.yml",
    "scripts/check.ps1",
    "scripts/install.ps1",
    "scripts/setup.ps1",
    "scripts/uninstall.ps1",
    "scripts/sync-all.ps1",
    "scripts/sync-resource-intelligence.ps1",
    "scripts/sync-skill-registry.ps1",
    "scripts/audit-description-overlap.ps1",
    "tests/routing-cases.csv",
    "skills/frontend-master/references/generated-skill-registry.md",
    "skills/fullstack-master/references/generated-skill-registry.md"
)

foreach ($relativeFile in $requiredFiles) {

    $fullPath = Join-Path `
        $repoRoot `
        $relativeFile

    if (-not (Test-Path $fullPath)) {
        Add-ValidationError "Missing required repository file: $relativeFile"
    }
}

$routingPath = Join-Path `
    $repoRoot `
    "tests/routing-cases.csv"

if (Test-Path $routingPath) {

    $routingCases = @(
        Import-Csv $routingPath
    )

    if ($routingCases.Count -lt 28) {
        Add-ValidationError "Routing suite should contain at least 28 cases."
    }

    $duplicateIds = @(
        $routingCases |
        Group-Object ID |
        Where-Object {
            $_.Count -gt 1
        }
    )

    if ($duplicateIds.Count -gt 0) {
        Add-ValidationError "Routing cases contain duplicate IDs."
    }

    foreach ($case in $routingCases) {

        if ($case.ExpectedPrimarySkill -notin $expectedSkills) {
            Add-ValidationError "Routing case references invalid skill: $($case.ExpectedPrimarySkill)"
        }
    }
}

$resourceCsvPath = Join-Path `
    $repoRoot `
    "resources/catalog.csv"

$resourceJsonPath = Join-Path `
    $repoRoot `
    "resources/catalog.json"

$resourceCount = 0

if (
    (Test-Path $resourceCsvPath) -and
    (Test-Path $resourceJsonPath)
) {

    $resourceCsv = @(
        Import-Csv $resourceCsvPath
    )

    $resourceJson = @(
        Get-Content `
            $resourceJsonPath `
            -Raw |
        ConvertFrom-Json
    )

    $resourceCount = $resourceCsv.Count

    if ($resourceCsv.Count -ne $resourceJson.Count) {
        Add-ValidationError "Resource CSV/JSON counts differ."
    }

    if ($resourceCsv.Count -eq 0) {
        Add-ValidationError "Resource catalog is empty."
    }
}

$resourceReferences = Join-Path `
    $repoRoot `
    "skills/frontend-resource-intelligence/references"

$resourceManifestPath = Join-Path `
    $resourceReferences `
    "MANIFEST.csv"

if (Test-Path $resourceManifestPath) {

    $manifestRows = @(
        Import-Csv $resourceManifestPath
    )

    foreach ($manifestRow in $manifestRows) {

        $filePath = Join-Path `
            $resourceReferences `
            $manifestRow.RelativePath

        if (-not (Test-Path $filePath)) {
            Add-ValidationError "Manifest file missing: $($manifestRow.RelativePath)"
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

Write-Host ""
Write-Host "=== Skill Validation ==="
Write-Host ""

$skillRows |
    Sort-Object Skill |
    Format-Table -AutoSize

Write-Host ""
Write-Host "Skill count: $($expectedSkills.Count)"
Write-Host "Description characters: $totalDescriptionCharacters"
Write-Host "Resource records: $resourceCount"
Write-Host "Validation errors: $($validationErrors.Count)"
Write-Host ""

if ($validationErrors.Count -gt 0) {

    $validationErrors |
        ForEach-Object {
            Write-Host "ERROR: $_"
        }

    throw "Repository validation failed."
}

Write-Host "PASS: Repository validation passed."
