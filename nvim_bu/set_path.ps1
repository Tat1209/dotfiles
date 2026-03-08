# -----------------------------------------------------------------------------
# nvim の設定フォルダへシンボリックリンクを作成する
# 実行には管理者権限が必要です
# -----------------------------------------------------------------------------

# 設定ファイルの本体がある場所 (dotfiles内)
$sourcePath = "$HOME\dotfiles\nvim"

# nvimが設定ファイルを読み込む場所 (リンクの作成先)
$targetPath = "$env:LOCALAPPDATA\nvim"

# リンク作成先にフォルダが既に存在するか確認
if (Test-Path $targetPath) {
    Remove-Item -Path $targetPath -Recurse -Force
}

# シンボリックリンクを作成
New-Item -Path $targetPath -ItemType SymbolicLink -Value $sourcePath
Write-Host "Symlink created. : $targetPath" -> $sourcePath
