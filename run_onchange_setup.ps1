# $ErrorActionPreference = "Continue"
# $packages = @("Git.Git", "Neovim.Neovim")

# foreach ($pkg in $packages) {
#     Write-Host "パッケージの検証中: $pkg"
    
#     # 1. パッケージがインストール済みか確認（標準出力・標準エラー出力を破棄して終了コードのみを取得）
#     winget list --id $pkg --exact > $null 2>&1
    
#     # winget list はパッケージが見つかった場合に 0、見つからない場合に非ゼロを返す
#     if ($LASTEXITCODE -eq 0) {
#         Write-Host "[$pkg] はインストール済みです。アップグレードを確認します。"
#         # --silent を追加してインストーラーのUI表示を抑制
#         winget upgrade --id $pkg --exact --silent --accept-source-agreements --accept-package-agreements
#     } else {
#         Write-Host "[$pkg] は未インストールです。インストールを実行します。"
#         winget install --id $pkg --exact --silent --accept-source-agreements --accept-package-agreements
#     }
# }