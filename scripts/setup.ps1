$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$installerPath = Join-Path $PSScriptRoot "install.ps1"

if (-not (Test-Path $installerPath)) {
    throw "install.ps1 was not found beside setup.ps1."
}

function Read-ProjectPath {

    while ($true) {

        Write-Host ""

        $candidate = Read-Host "Enter the full path to the project"

        if ([string]::IsNullOrWhiteSpace($candidate)) {

            Write-Host "A project path is required."
            continue
        }

        $candidate = $candidate.Trim().Trim('"')

        if (Test-Path -LiteralPath $candidate -PathType Container) {

            return (
                Resolve-Path -LiteralPath $candidate
            ).Path
        }

        Write-Host "Folder not found: $candidate"
    }
}

function Invoke-HalalFrFrInstall {

    param(
        [string]$Target,
        [string]$Mode = "Copy",
        [string]$ProjectPath = ""
    )

    Write-Host ""
    Write-Host "Installing HalalFrFr Frontend Skills..."
    Write-Host ""

    if (
        $Target -eq "AgentsProject" -or
        $Target -eq "CursorProject"
    ) {

        & $installerPath `
            -Target $Target `
            -Mode $Mode `
            -ProjectPath $ProjectPath

        if ($LASTEXITCODE -ne 0) {
            throw "Installation failed."
        }

        return
    }

    & $installerPath `
        -Target $Target `
        -Mode $Mode

    if ($LASTEXITCODE -ne 0) {
        throw "Installation failed."
    }
}

Write-Host ""
Write-Host "=============================================="
Write-Host " HalalFrFr Frontend Skills Setup"
Write-Host "=============================================="
Write-Host ""
Write-Host "Where should the 18 skills be installed?"
Write-Host ""
Write-Host "[1] Global - Cursor + Codex (Recommended)"
Write-Host "    Available across your projects."
Write-Host ""
Write-Host "[2] One Project - Cursor + Codex"
Write-Host "    Available only inside a selected project."
Write-Host ""
Write-Host "[3] Advanced - Cursor-specific location"
Write-Host ""
Write-Host "[4] Cancel"
Write-Host ""

$choice = (
    Read-Host "Choose 1, 2, 3, or 4"
).Trim()

if ($choice -eq "1") {

    Invoke-HalalFrFrInstall `
        -Target "AgentsUser" `
        -Mode "Copy"

    Write-Host ""
    Write-Host "Installed globally for Cursor + Codex."
    Write-Host "Location: $HOME\.agents\skills"
    Write-Host ""
    Write-Host "Restart or reopen your agent session if needed."

    exit 0
}

if ($choice -eq "2") {

    $projectPath = Read-ProjectPath

    Invoke-HalalFrFrInstall `
        -Target "AgentsProject" `
        -Mode "Copy" `
        -ProjectPath $projectPath

    Write-Host ""
    Write-Host "Installed for this project only."
    Write-Host "Project: $projectPath"
    Write-Host ""
    Write-Host "Restart or reopen your agent session if needed."

    exit 0
}

if ($choice -eq "3") {

    Write-Host ""
    Write-Host "Cursor-specific installation"
    Write-Host ""
    Write-Host "[1] Cursor Global"
    Write-Host "    $HOME\.cursor\skills"
    Write-Host ""
    Write-Host "[2] Cursor Project"
    Write-Host "    <project>\.cursor\skills"
    Write-Host ""
    Write-Host "[3] Cancel"
    Write-Host ""

    $cursorChoice = (
        Read-Host "Choose 1, 2, or 3"
    ).Trim()

    if ($cursorChoice -eq "1") {

        Invoke-HalalFrFrInstall `
            -Target "CursorUser" `
            -Mode "Copy"

        Write-Host ""
        Write-Host "Installed to Cursor global skills."
        Write-Host "Location: $HOME\.cursor\skills"

        exit 0
    }

    if ($cursorChoice -eq "2") {

        $projectPath = Read-ProjectPath

        Invoke-HalalFrFrInstall `
            -Target "CursorProject" `
            -Mode "Copy" `
            -ProjectPath $projectPath

        Write-Host ""
        Write-Host "Installed to Cursor project skills."
        Write-Host "Project: $projectPath"

        exit 0
    }

    if ($cursorChoice -eq "3") {

        Write-Host ""
        Write-Host "Setup cancelled."

        exit 0
    }

    Write-Host ""
    Write-Host "Invalid Cursor installation choice."

    exit 1
}

if ($choice -eq "4") {

    Write-Host ""
    Write-Host "Setup cancelled."

    exit 0
}

Write-Host ""
Write-Host "Invalid setup choice."

exit 1
