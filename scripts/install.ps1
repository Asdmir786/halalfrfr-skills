param(
    [ValidateSet(
        "AgentsUser",
        "AgentsProject",
        "CursorUser",
        "CursorProject"
    )]
    [string]$Target = "AgentsUser",

    [ValidateSet(
        "Copy",
        "Link"
    )]
    [string]$Mode = "Copy",

    [string]$ProjectPath = "",

    [switch]$Force
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$configPath = Join-Path $repoRoot "config/skill-set.json"

if (-not (Test-Path $configPath)) {
    throw "Missing config/skill-set.json"
}

$config = Get-Content $configPath -Raw | ConvertFrom-Json

$skillNames = @(
    $config.skills |
    ForEach-Object {
        $_.name
    }
)

if ($skillNames.Count -ne $config.canonicalSkillCount) {
    throw "Canonical skill inventory is inconsistent."
}

$targetRoot = ""

switch ($Target) {

    "AgentsUser" {
        $targetRoot = Join-Path $HOME ".agents/skills"
    }

    "CursorUser" {
        $targetRoot = Join-Path $HOME ".cursor/skills"
    }

    "AgentsProject" {

        if ([string]::IsNullOrWhiteSpace($ProjectPath)) {
            throw "ProjectPath is required for AgentsProject."
        }

        $resolvedProject = (
            Resolve-Path -LiteralPath $ProjectPath
        ).Path

        $targetRoot = Join-Path $resolvedProject ".agents/skills"
    }

    "CursorProject" {

        if ([string]::IsNullOrWhiteSpace($ProjectPath)) {
            throw "ProjectPath is required for CursorProject."
        }

        $resolvedProject = (
            Resolve-Path -LiteralPath $ProjectPath
        ).Path

        $targetRoot = Join-Path $resolvedProject ".cursor/skills"
    }
}

New-Item `
    -ItemType Directory `
    -Force `
    -Path $targetRoot |
    Out-Null

$manifestPath = Join-Path `
    $targetRoot `
    ".halalfrfr-skills.json"

$legacyManifestPath = Join-Path `
    $targetRoot `
    ".halalfrfr-frontend-skills.json"

$managedNames = @()

if (Test-Path $manifestPath) {

    $existingManifest = Get-Content `
        $manifestPath `
        -Raw |
        ConvertFrom-Json

    $managedNames += @(
        $existingManifest.skills
    )
}

if (Test-Path $legacyManifestPath) {

    $legacyManifest = Get-Content `
        $legacyManifestPath `
        -Raw |
        ConvertFrom-Json

    $managedNames += @(
        $legacyManifest.skills
    )
}

$managedNames = @(
    $managedNames |
    Sort-Object -Unique
)

$collisions = @()

foreach ($skillName in $skillNames) {

    $sourceSkill = Join-Path `
        $repoRoot `
        "skills/$skillName"

    $destinationSkill = Join-Path `
        $targetRoot `
        $skillName

    if (-not (Test-Path "$sourceSkill/SKILL.md")) {
        throw "Invalid source skill: $skillName"
    }

    if (
        (Test-Path $destinationSkill) -and
        ($skillName -notin $managedNames) -and
        (-not $Force)
    ) {
        $collisions += $skillName
    }
}

if ($collisions.Count -gt 0) {

    Write-Host ""
    Write-Host "Unmanaged same-name skills were found:"

    $collisions |
    ForEach-Object {
        Write-Host " - $_"
    }

    throw "Nothing was overwritten. Back up/remove the conflicts or rerun with -Force."
}

foreach ($skillName in $skillNames) {

    $sourceSkill = Join-Path `
        $repoRoot `
        "skills/$skillName"

    $destinationSkill = Join-Path `
        $targetRoot `
        $skillName

    if (Test-Path $destinationSkill) {
        Remove-Item `
            -LiteralPath $destinationSkill `
            -Recurse `
            -Force
    }

    if ($Mode -eq "Copy") {

        Copy-Item `
            -LiteralPath $sourceSkill `
            -Destination $targetRoot `
            -Recurse `
            -Force
    }

    if ($Mode -eq "Link") {

        try {
            New-Item `
                -ItemType SymbolicLink `
                -Path $destinationSkill `
                -Target $sourceSkill |
                Out-Null
        }
        catch {
            throw "Could not create symbolic link for $skillName. Use -Mode Copy if symbolic links are unavailable."
        }
    }
}

$manifest = [PSCustomObject]@{
    package = "halalfrfr-skills"
    target = $Target
    mode = $Mode
    canonicalSkillCount = $skillNames.Count
    skills = $skillNames
    installedAt = (Get-Date).ToString("o")
    source = $repoRoot
}

$manifest |
    ConvertTo-Json -Depth 5 |
    Set-Content `
        -LiteralPath $manifestPath `
        -Encoding UTF8

if (Test-Path $legacyManifestPath) {
    Remove-Item `
        -LiteralPath $legacyManifestPath `
        -Force
}

Write-Host ""
Write-Host "HalalFrFr Skills installed."
Write-Host "Target: $targetRoot"
Write-Host "Mode: $Mode"
Write-Host "Skills: $($skillNames.Count)"
Write-Host ""
Write-Host "Restart or reopen the agent session if skill discovery does not refresh immediately."
