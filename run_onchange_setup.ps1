Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
$ErrorActionPreference = "Continue"

$packages = @("Git.Git", "Neovim.Neovim")

foreach ($pkg in $packages) {
    Write-Host "Checking and installing/updating: $pkg"
    
    # 1. インストールを試行
    winget install --id $pkg --exact --accept-source-agreements --accept-package-agreements
    
    # 2. 既にインストール済み等の理由で終了コードが0以外だった場合、アップグレードを試行
    if ($LASTEXITCODE -ne 0) {
        winget upgrade --id $pkg --exact --accept-source-agreements --accept-package-agreements
    }
}