param(
    # The path to the directory containing the subdirectories to search.
    [Parameter(Mandatory=$true)]
    [string]$TargetDirectory,

    # An array of child script names to look for and execute within each subdirectory.
    [Parameter(Mandatory=$false)]
    [string[]]$ChildScriptNames = @("set_path.ps1") # Default value for backward compatibility
)

# Verify that the provided path is a valid directory.
if (-not (Test-Path -Path $TargetDirectory -PathType Container)) {
    Write-Error "The specified directory does not exist: $TargetDirectory"
    # Stop the script if the directory is not found.
    return
}

# Find all subdirectories within the target directory and process each one.
Get-ChildItem -Path $TargetDirectory -Directory | ForEach-Object {
    $currentSubdirectory = $_.FullName

    # Iterate through each specified child script name.
    foreach ($scriptName in $ChildScriptNames) {
        # Construct the full path to the potential child script file.
        $scriptToRun = Join-Path -Path $currentSubdirectory -ChildPath $scriptName

        # If the child script exists, execute it in the current scope.
        if (Test-Path -Path $scriptToRun -PathType Leaf) {
            Write-Host "Executing $($scriptName) in $($currentSubdirectory)..."
            . $scriptToRun
        }
    }
}