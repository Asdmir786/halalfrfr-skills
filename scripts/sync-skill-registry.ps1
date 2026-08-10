$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot

$skillsRoot = Join-Path `
    $repoRoot `
    "skills"

$masterRoot = Join-Path `
    $skillsRoot `
    "frontend-master"

$masterReferences = Join-Path `
    $masterRoot `
    "references"

$outputPath = Join-Path `
    $masterReferences `
    "generated-skill-registry.md"

$rows = @()

Get-ChildItem `
    -Path $skillsRoot `
    -Directory |
    Sort-Object Name |
    ForEach-Object {

        $skillFile = Join-Path `
            $_.FullName `
            "SKILL.md"

        if (-not (Test-Path $skillFile)) {
            return
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

        if (-not $nameMatch.Success) {
            throw "Missing name frontmatter: $skillFile"
        }

        if (-not $descriptionMatch.Success) {
            throw "Missing description frontmatter: $skillFile"
        }

        $skillName = $nameMatch.Groups[1].Value.Trim()

        $description = $descriptionMatch.Groups[1].Value.Trim()

        $description = $description.Replace(
            "|",
            "\|"
        )

        $rows += [PSCustomObject]@{
            Name        = $skillName
            Description = $description
        }
    }

$lines = @(
    "# Generated Skill Registry",
    "",
    "Generated from the current canonical SKILL.md frontmatter.",
    "",
    "Do not edit manually.",
    "",
    "| Skill | Description |",
    "|---|---|"
)

foreach ($row in $rows) {

    $lines += "| $($row.Name) | $($row.Description) |"
}

Set-Content `
    -Path $outputPath `
    -Value $lines `
    -Encoding UTF8

Write-Host "Skill registry synchronized."
Write-Host "Skills indexed: $($rows.Count)"
