$ErrorActionPreference = "Stop"

$scriptRoot = $PSScriptRoot

& (Join-Path $scriptRoot "sync-all.ps1")
& (Join-Path $scriptRoot "validate-repo.ps1")
& (Join-Path $scriptRoot "audit-description-overlap.ps1")

Write-Host ""
Write-Host "PASS: All repository checks completed."
