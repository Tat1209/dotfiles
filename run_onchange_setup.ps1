$ErrorActionPreference = "Continue"

$packages = @("Neovim.Neovim", "zig.zig")
# $packages = @("Git.Git", "Neovim.Neovim", "zig.zig")

foreach ($pkg in $packages) {
    Write-Host "Installing/updating: $pkg"
    winget install --id $pkg --exact --accept-source-agreements --accept-package-agreements
}