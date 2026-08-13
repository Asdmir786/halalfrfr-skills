param(
    [ValidateSet(
        "AgentsUser",
        "AgentsProject",
        "CursorUser",
        "CursorProject"
    )]
    [string]$Target = "AgentsUser",

    [string]$ProjectPath = ""
)

$ErrorActionPreference = "Stop"

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

$manifestPath = Join-Path `
    $targetRoot `
    ".halalfrfr-skills.json"

if (-not (Test-Path $manifestPath)) {
    throw "HalalFrFr unified installation manifest was not found."
}

$manifest = Get-Content `
    $manifestPath `
    -Raw |
    ConvertFrom-Json

foreach ($skillName in @($manifest.skills)) {

    $skillPath = Join-Path `
        $targetRoot `
        $skillName

    if (Test-Path $skillPath) {

        Remove-Item `
            -LiteralPath $skillPath `
            -Recurse `
            -Force

        Write-Host "REMOVED: $skillName"
    }
}

Remove-Item `
    -LiteralPath $manifestPath `
    -Force

Write-Host ""
Write-Host "HalalFrFr managed skills removed."
Write-Host "Unrelated skills were preserved."
