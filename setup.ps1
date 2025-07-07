#Requires -RunAsAdministrator

# --- Main script logic (Assumes Administrator privileges) ---
Write-Host "Script is running with Administrator privileges." -ForegroundColor Green

# Get the path of the directory where this script is located ($PSScriptRoot is the root)
$rootDir = $PSScriptRoot

# Construct the path to the child setup script, specifically 'set_paths.ps1'
$childScriptPath = Join-Path -Path $rootDir -ChildPath "scripts\set_paths.ps1"

# Check if the child script exists before trying to run it
if (Test-Path -Path $childScriptPath) {
    # Execute the child script and pass the root directory path as 'TargetDirectory'
    & $childScriptPath -TargetDirectory $rootDir
} else {
    Write-Error "Child script 'set_paths.ps1' not found at: $childScriptPath"
}

Write-Host "Main setup script finished."