param(

    [ValidateSet(
        "AgentsUser",
        "AgentsProject",
        "CursorUser",
        "CursorProject"
    )]
    [string]$Target = "AgentsUser",

    [string]$ProjectPath = (Get-Location).Path
)

$ErrorActionPreference = "Stop"

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

    throw "Unsupported uninstall target."
}

$targetRoot = Get-TargetRoot `
    -TargetName $Target `
    -RequestedProjectPath $ProjectPath

$manifestPath = Join-Path `
    $targetRoot `
    ".halalfrfr-frontend-skills.json"

if (-not (Test-Path $manifestPath)) {

    throw "No HalalFrFr installation manifest exists at $manifestPath. Nothing was removed."
}

$manifest = Get-Content `
    -Path $manifestPath `
    -Raw |
    ConvertFrom-Json

if (
    $manifest.package -ne
    "halalfrfr-frontend-skills"
) {
    throw "Installation manifest does not belong to HalalFrFr Frontend Skills."
}

$removed = 0

foreach ($skillName in @($manifest.skills)) {

    $skillPath = Join-Path `
        $targetRoot `
        $skillName

    if (Test-Path $skillPath) {

        Remove-Item `
            -LiteralPath $skillPath `
            -Recurse `
            -Force

        $removed++
    }
}

Remove-Item `
    -LiteralPath $manifestPath `
    -Force

Write-Host ""
Write-Host "HalalFrFr Frontend Skills uninstalled."
Write-Host "Removed skills: $removed"
Write-Host "Target root preserved: $targetRoot"
