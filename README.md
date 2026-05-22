# dotfiles

本リポジトリは、[chezmoi](https://www.chezmoi.io/) を用いて管理されている環境構築用のdotfilesです。

## Windows環境

### クイックスタート

管理者権限でPowerShellを起動し、以下のスクリプトをコピー＆ペーストして実行してください。権限設定からインストール、適用まで自動で完了します。

```powershell
# 1. 実行ポリシーの変更 (現在のユーザーに対するスクリプト実行権限の付与)
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

# 2. Git と chezmoi のインストール (wingetを利用)
winget install Git.Git --silent
winget install twpayne.chezmoi --silent

# 3. 環境変数の再読み込み (インストールしたコマンドを現在のセッションで即時有効化)
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# 4. chezmoi の初期化と適用
chezmoi init https://github.com/Tat1209/dotfiles.git
chezmoi apply
```

※ 実行後にコマンドが認識されない場合は、PowerShellを一度再起動してください。

---

### WSL経由で初期化する場合

Windows環境で `fork: retry: Resource temporarily unavailable` などのエラーが発生する場合は、WSL上でリポジトリの取得のみ行い、適用はWindows側のPowerShellから実行してください。

WSLのターミナルを開き、以下を実行してください。

```bash
# 1. Git のインストール
sudo apt update && sudo apt install -y git

# 2. chezmoi のソースディレクトリを作成 (Windows側に直接配置)
mkdir -p /mnt/c/Users/$USER/.local/share

# 3. WSL上の Git で dotfiles を取得
git clone https://github.com/Tat1209/dotfiles.git /mnt/c/Users/$USER/.local/share/chezmoi
```

その後、Windows側のPowerShellを開き、以下を実行してください。

```powershell
# 1. Git と chezmoi のインストール (未導入の場合)
winget install Git.Git --silent
winget install twpayne.chezmoi --silent

# 2. 環境変数の再読み込み
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# 3. Windows側で適用
chezmoi apply
```

※ WSL上で `chezmoi apply` を実行すると、テンプレート内のOS判定がLinuxとして評価される場合があります。Windows向けの VSCode や Neovim の設定を適用する場合は、必ずWindows側のPowerShellから `chezmoi apply` を実行してください。

※ `$USER` がWindowsのユーザー名と一致しない場合は、適宜置き換えてください。

例:

```bash
git clone https://github.com/Tat1209/dotfiles.git /mnt/c/Users/10001265395/.local/share/chezmoi
```

---

## Linux環境 (Debian/Ubuntu系)

### クイックスタート

ターミナルを開き、以下のスクリプトをコピー＆ペーストして実行してください。前提パッケージの導入から適用まで自動で完了します。

```bash
# 1. Git と curl のインストール
sudo apt update && sudo apt install -y git curl

# 2. chezmoi のインストール (公式スクリプトにより ~/.local/bin 等に配置)
sh -c "$(curl -fsLS get.chezmoi.io)"

# 3. インストールされた chezmoi へのパスを通す
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# 4. chezmoi の初期化と適用
chezmoi init https://github.com/Tat1209/dotfiles.git
chezmoi apply
```

---

## 補足: 強制適用とステートのリセット (OS共通)

既存のファイルと競合した場合や、クリーンな状態から再適用したい場合は、以下のコマンドを使用してください。

**強制適用**

```shell
chezmoi apply --force
```

**ステートの完全リセットと再適用**

```shell
chezmoi init https://github.com/Tat1209/dotfiles.git
chezmoi state reset
chezmoi apply
```
