$packages = @("Git.Git", "Neovim.Neovim")

foreach ($pkg in $packages) {
    Write-Host "パッケージの検証中: $pkg"
    
    # 修正点: 初回実行時の利用規約同意プロンプトによるフリーズを防ぐため --accept-source-agreements を追加
    winget list --id $pkg --exact --accept-source-agreements > $null 2>&1
    
    # winget list はパッケージが見つかった場合に 0、見つからない場合に非ゼロを返す
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[$pkg] はインストール済みです。アップグレードを確認します。"
        winget upgrade --id $pkg --exact --silent --accept-source-agreements --accept-package-agreements
    } else {
        Write-Host "[$pkg] は未インストールです。インストールを実行します。"
        winget install --id $pkg --exact --silent --accept-source-agreements --accept-package-agreements
    }
}