$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$configPath = Join-Path $repoRoot "config/skill-set.json"

if (-not (Test-Path $configPath)) {
    throw "Missing config/skill-set.json"
}

$config = Get-Content $configPath -Raw | ConvertFrom-Json

function Write-Utf8Lf {
    param(
        [string]$Path,
        [string]$Content
    )

    $normalized = $Content.Replace("`r`n", "`n").Replace("`r", "`n").TrimEnd() + "`n"

    [IO.File]::WriteAllText(
        $Path,
        $normalized,
        [System.Text.UTF8Encoding]::new($false)
    )
}

$records = @()

foreach ($entry in $config.skills) {

    $skillFile = Join-Path $repoRoot "skills/$($entry.name)/SKILL.md"

    if (-not (Test-Path $skillFile)) {
        throw "Missing SKILL.md for $($entry.name)"
    }

    $content = Get-Content $skillFile -Raw

    $descriptionMatch = [regex]::Match(
        $content,
        '(?m)^description:\s*(.+?)\s*$'
    )

    if (-not $descriptionMatch.Success) {
        throw "Missing description for $($entry.name)"
    }

    $records += [PSCustomObject]@{
        Name = $entry.name
        Layer = $entry.layer
        Category = $entry.category
        Description = $descriptionMatch.Groups[1].Value.Trim()
    }
}

function New-Registry {
    param(
        [string]$Title,
        [array]$Items
    )

    $lines = @(
        "# $Title",
        "",
        "Generated from config/skill-set.json and canonical SKILL.md frontmatter.",
        "",
        "| Skill | Layer | Category | Description |",
        "|---|---|---|---|"
    )

    foreach ($item in $Items) {
        $description = $item.Description.Replace("|", "\|")

        $lines += "| ``$($item.Name)`` | $($item.Layer) | $($item.Category) | $description |"
    }

    return ($lines -join "`n")
}

$frontendRecords = @(
    $records |
    Where-Object {
        $_.Layer -eq "frontend"
    }
)

$frontendRegistry = Join-Path `
    $repoRoot `
    "skills/frontend-master/references/generated-skill-registry.md"

$fullstackRegistry = Join-Path `
    $repoRoot `
    "skills/fullstack-master/references/generated-skill-registry.md"

Write-Utf8Lf `
    -Path $frontendRegistry `
    -Content (
        New-Registry `
            -Title "Frontend Skill Registry" `
            -Items $frontendRecords
    )

Write-Utf8Lf `
    -Path $fullstackRegistry `
    -Content (
        New-Registry `
            -Title "Unified HalalFrFr Skill Registry" `
            -Items $records
    )

Write-Host "Skill registries synchronized."
Write-Host "Frontend skills indexed: $($frontendRecords.Count)"
Write-Host "Unified skills indexed: $($records.Count)"
