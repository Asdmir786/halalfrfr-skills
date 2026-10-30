$ErrorActionPreference = "Stop"

$installer = Join-Path $PSScriptRoot "install.ps1"

if (-not (Test-Path $installer)) {
    throw "install.ps1 was not found."
}

Write-Host ""
Write-Host "HalalFrFr Skills"
$config = Get-Content (Join-Path $PSScriptRoot "../config/skill-set.json") -Raw | ConvertFrom-Json
Write-Host "Installing the unified $($config.canonicalSkillCount)-skill package globally..."
Write-Host ""

& $installer `
    -Target AgentsUser `
    -Mode Copy

Write-Host ""
Write-Host "Setup complete."
