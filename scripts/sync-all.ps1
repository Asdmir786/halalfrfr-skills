$ErrorActionPreference = "Stop"

$scriptRoot = $PSScriptRoot

& (Join-Path $scriptRoot "sync-resource-intelligence.ps1")
& (Join-Path $scriptRoot "sync-skill-registry.ps1")

Write-Host ""
Write-Host "PASS: Generated repository files synchronized."
