$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot

$resourcesRoot = Join-Path $repoRoot "resources"

$docsRoot = Join-Path $repoRoot "docs"

$sourcePolicy = Join-Path `
    $docsRoot `
    "RESOURCE_POLICY.md"

$skillsRoot = Join-Path $repoRoot "skills"

$resourceSkill = Join-Path `
    $skillsRoot `
    "frontend-resource-intelligence"

$destination = Join-Path `
    $resourceSkill `
    "references"

if (-not (Test-Path $resourcesRoot)) {
    throw "Canonical resources directory missing."
}

if (-not (Test-Path (Join-Path $resourcesRoot "catalog.csv"))) {
    throw "resources/catalog.csv missing."
}

if (-not (Test-Path (Join-Path $resourcesRoot "catalog.json"))) {
    throw "resources/catalog.json missing."
}

if (-not (Test-Path $sourcePolicy)) {
    throw "docs/RESOURCE_POLICY.md missing."
}

if (Test-Path $destination) {
    Remove-Item `
        -LiteralPath $destination `
        -Recurse `
        -Force
}

New-Item `
    -ItemType Directory `
    -Force `
    -Path $destination |
    Out-Null

Copy-Item `
    -LiteralPath (Join-Path $resourcesRoot "catalog.csv") `
    -Destination (Join-Path $destination "catalog.csv") `
    -Force

Copy-Item `
    -LiteralPath (Join-Path $resourcesRoot "catalog.json") `
    -Destination (Join-Path $destination "catalog.json") `
    -Force

Copy-Item `
    -LiteralPath $sourcePolicy `
    -Destination (Join-Path $destination "RESOURCE_POLICY.md") `
    -Force

$catalogDestination = Join-Path `
    $destination `
    "catalog"

New-Item `
    -ItemType Directory `
    -Force `
    -Path $catalogDestination |
    Out-Null

$categoryFolders = @(
    "3d",
    "benchmarks",
    "components",
    "design",
    "foundations",
    "inspiration",
    "motion",
    "qa"
)

foreach ($folder in $categoryFolders) {

    $sourceFolder = Join-Path `
        $resourcesRoot `
        $folder

    if (-not (Test-Path $sourceFolder)) {
        continue
    }

    $targetFolder = Join-Path `
        $catalogDestination `
        $folder

    New-Item `
        -ItemType Directory `
        -Force `
        -Path $targetFolder |
        Out-Null

    Get-ChildItem `
        -Path $sourceFolder `
        -File `
        -Recurse |
        ForEach-Object {

            $relativePath = [IO.Path]::GetRelativePath(
                $sourceFolder,
                $_.FullName
            )

            $relativeDirectory = Split-Path `
                -Parent `
                $relativePath

            $destinationDirectory = $targetFolder

            if (-not [string]::IsNullOrWhiteSpace($relativeDirectory)) {

                foreach ($segment in ($relativeDirectory -split '[\\/]')) {

                    if (-not [string]::IsNullOrWhiteSpace($segment)) {
                        $destinationDirectory = Join-Path `
                            $destinationDirectory `
                            $segment
                    }
                }

                New-Item `
                    -ItemType Directory `
                    -Force `
                    -Path $destinationDirectory |
                    Out-Null
            }

            Copy-Item `
                -LiteralPath $_.FullName `
                -Destination (
                    Join-Path `
                        $destinationDirectory `
                        $_.Name
                ) `
                -Force
        }
}

$manifestPath = Join-Path `
    $destination `
    "MANIFEST.csv"

$manifestRows = @(
    Get-ChildItem `
        -Path $destination `
        -File `
        -Recurse |
        Where-Object {
            $_.FullName -ne $manifestPath
        } |
        ForEach-Object {

            $relativePath = [IO.Path]::GetRelativePath(
                $destination,
                $_.FullName
            )

            $relativePath = $relativePath -replace '\\','/'

            $hash = Get-FileHash `
                -LiteralPath $_.FullName `
                -Algorithm SHA256

            [PSCustomObject]@{
                RelativePath = $relativePath
                Bytes        = $_.Length
                SHA256       = $hash.Hash
            }
        } |
        Sort-Object RelativePath
)

$manifestRows |
    Export-Csv `
        -Path $manifestPath `
        -NoTypeInformation `
        -Encoding UTF8

Write-Host "Resource intelligence synchronized."
Write-Host "Generated files: $($manifestRows.Count + 1)"
