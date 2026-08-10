$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot

$skillsRoot = Join-Path `
    $repoRoot `
    "skills"

$stopWords = @(
    "the",
    "and",
    "for",
    "with",
    "when",
    "use",
    "uses",
    "using",
    "from",
    "into",
    "that",
    "this",
    "only",
    "work",
    "works",
    "project",
    "projects",
    "frontend",
    "implementation",
    "implement",
    "design",
    "system",
    "systems",
    "component",
    "components",
    "existing"
)

function Get-DescriptionTokens {

    param(
        [string]$Text
    )

    $matches = [regex]::Matches(
        $Text.ToLowerInvariant(),
        '[a-z0-9][a-z0-9.+#/-]*'
    )

    $tokens = @(
        $matches |
        ForEach-Object {
            $_.Value
        } |
        Where-Object {
            $_.Length -ge 3 -and
            $_ -notin $stopWords
        } |
        Sort-Object -Unique
    )

    return $tokens
}

$skills = @()

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

        $descriptionMatch = [regex]::Match(
            $content,
            '(?m)^description:\s*(.+?)\s*$'
        )

        if (-not $descriptionMatch.Success) {
            throw "Missing description in $($_.Name)"
        }

        $description = $descriptionMatch.Groups[1].Value.Trim()

        $skills += [PSCustomObject]@{
            Name        = $_.Name
            Description = $description
            Tokens      = @(Get-DescriptionTokens $description)
        }
    }

$results = @()

for ($i = 0; $i -lt $skills.Count; $i++) {

    for ($j = $i + 1; $j -lt $skills.Count; $j++) {

        $left = $skills[$i]
        $right = $skills[$j]

        $union = @(
            $left.Tokens +
            $right.Tokens |
            Sort-Object -Unique
        )

        $intersection = @(
            $left.Tokens |
            Where-Object {
                $_ -in $right.Tokens
            }
        )

        $score = 0

        if ($union.Count -gt 0) {
            $score = [math]::Round(
                $intersection.Count / $union.Count,
                3
            )
        }

        $results += [PSCustomObject]@{
            SkillA     = $left.Name
            SkillB     = $right.Name
            Similarity = $score
            Shared     = ($intersection -join ", ")
        }
    }
}

Write-Host ""
Write-Host "=== Highest Description Similarities ==="
Write-Host ""

$results |
    Sort-Object Similarity -Descending |
    Select-Object -First 10 |
    Format-Table -AutoSize

$exactDuplicates = @()

for ($i = 0; $i -lt $skills.Count; $i++) {

    for ($j = $i + 1; $j -lt $skills.Count; $j++) {

        if (
            $skills[$i].Description -eq
            $skills[$j].Description
        ) {
            $exactDuplicates += "$($skills[$i].Name) / $($skills[$j].Name)"
        }
    }
}

$dangerouslySimilar = @(
    $results |
    Where-Object {
        $_.Similarity -ge 0.55
    }
)

Write-Host ""
Write-Host "Exact duplicate descriptions: $($exactDuplicates.Count)"
Write-Host "Pairs above 0.55 similarity: $($dangerouslySimilar.Count)"

$exactDuplicates |
    ForEach-Object {
        Write-Host "DUPLICATE: $_"
    }

$dangerouslySimilar |
    ForEach-Object {
        Write-Host "HIGH OVERLAP: $($_.SkillA) / $($_.SkillB) = $($_.Similarity)"
    }

if ($exactDuplicates.Count -gt 0) {
    throw "Duplicate trigger descriptions found."
}

if ($dangerouslySimilar.Count -gt 0) {
    throw "Trigger descriptions are too similar."
}

Write-Host ""
Write-Host "PASS: Description overlap audit passed."
