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

    [string]$ProjectPath = (Get-Location).Path,

    [switch]$Force
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot

$skillsRoot = Join-Path `
    $repoRoot `
    "skills"

function Get-TargetRoot {

    param(
        [string]$TargetName,
        [string]$RequestedProjectPath
    )

    switch ($TargetName) {

        "AgentsUser" {

            return Join-Path `
                (Join-Path $HOME ".agents") `
                "skills"
        }

        "CursorUser" {

            return Join-Path `
                (Join-Path $HOME ".cursor") `
                "skills"
        }

        "AgentsProject" {

            $projectRoot = [IO.Path]::GetFullPath(
                $RequestedProjectPath
            )

            return Join-Path `
                (Join-Path $projectRoot ".agents") `
                "skills"
        }

        "CursorProject" {

            $projectRoot = [IO.Path]::GetFullPath(
                $RequestedProjectPath
            )

            return Join-Path `
                (Join-Path $projectRoot ".cursor") `
                "skills"
        }
    }

    throw "Unsupported installation target."
}

$targetRoot = Get-TargetRoot `
    -TargetName $Target `
    -RequestedProjectPath $ProjectPath

New-Item `
    -ItemType Directory `
    -Force `
    -Path $targetRoot |
    Out-Null

$manifestPath = Join-Path `
    $targetRoot `
    ".halalfrfr-frontend-skills.json"

$managedSkills = @()

if (Test-Path $manifestPath) {

    $existingManifest = Get-Content `
        -Path $manifestPath `
        -Raw |
        ConvertFrom-Json

    if (
        $existingManifest.package -eq
        "halalfrfr-frontend-skills"
    ) {
        $managedSkills = @(
            $existingManifest.skills
        )
    }
}

$skillNames = @(
    Get-ChildItem `
        -Path $skillsRoot `
        -Directory |
    Where-Object {
        Test-Path (
            Join-Path `
                $_.FullName `
                "SKILL.md"
        )
    } |
    Sort-Object Name |
    Select-Object -ExpandProperty Name
)

if ($skillNames.Count -ne 18) {
    throw "Expected 18 canonical skills before installation."
}

foreach ($skillName in $skillNames) {

    $source = Join-Path `
        $skillsRoot `
        $skillName

    $destination = Join-Path `
        $targetRoot `
        $skillName

    if (Test-Path $destination) {

        $isManaged = (
            $skillName -in
            $managedSkills
        )

        if (-not $isManaged -and -not $Force) {

            throw "Refusing to overwrite unmanaged skill '$skillName'. Re-run with -Force only if you intentionally want to replace it."
        }

        Remove-Item `
            -LiteralPath $destination `
            -Recurse `
            -Force
    }

    if ($Mode -eq "Copy") {

        Copy-Item `
            -LiteralPath $source `
            -Destination $destination `
            -Recurse `
            -Force
    }

    if ($Mode -eq "Link") {

        try {

            New-Item `
                -ItemType SymbolicLink `
                -Path $destination `
                -Target $source |
                Out-Null
        }
        catch {

            throw "Could not create symbolic link for '$skillName'. Use -Mode Copy if symbolic-link permissions are unavailable. $($_.Exception.Message)"
        }
    }
}

$manifest = [ordered]@{
    schema      = 1
    package     = "halalfrfr-frontend-skills"
    source      = [IO.Path]::GetFullPath($repoRoot)
    target      = $Target
    mode        = $Mode
    installedAt = (Get-Date).ToString("o")
    skills      = $skillNames
}

$manifest |
    ConvertTo-Json -Depth 5 |
    Set-Content `
        -Path $manifestPath `
        -Encoding UTF8

Write-Host ""
Write-Host "HalalFrFr Frontend Skills installed."
Write-Host "Target: $targetRoot"
Write-Host "Mode: $Mode"
Write-Host "Skills: $($skillNames.Count)"
Write-Host ""
Write-Host "If your agent does not immediately show the updated skills, restart or reopen the agent session."
