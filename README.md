# dotfiles

本リポジトリは、[chezmoi](https://www.chezmoi.io/) を用いて管理されている環境構築用のdotfilesです。

## Windows環境

### 一括セットアップスクリプト

管理者権限でPowerShellを起動し、以下のスクリプトをコピー＆ペーストして実行してください。これにより、事前設定、Gitとchezmoiのインストール、およびdotfilesの適用がすべて完了します。

```powershell
# 1. 実行ポリシーの変更
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

# 2. Git と chezmoi のインストール
winget install Git.Git --silent
winget install twpayne.chezmoi --silent

# 環境変数の再読み込み (インストールしたコマンドを現在のセッションで有効にするため)
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# 3. chezmoi の初期化と適用
chezmoi init [https://github.com/Tat1209/dotfiles.git](https://github.com/Tat1209/dotfiles.git)
chezmoi apply
```

### ステップ別手順

個別に実行する場合は以下の手順に従ってください。

**1. 事前設定 (PowerShellの管理者起動と実行ポリシー変更)**
キーボードの `Win` + `X` キーを押下後、`A` キーを押し、管理者モードでPowerShell（またはターミナル）を起動します。その後、以下のコマンドを実行して現在のユーザーに対する実行権限を付与します。
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**2. Git および chezmoi のインストール**
`winget` コマンドを使用して公式パッケージをインストールします。
```powershell
winget install Git.Git
winget install twpayne.chezmoi
```
※ インストール後、コマンドが認識されない場合はPowerShellを一度再起動してください。

**3. chezmoiの初期化と適用**
対象リポジトリを指定して初期化し、設定を適用します。
```powershell
chezmoi init [https://github.com/Tat1209/dotfiles.git](https://github.com/Tat1209/dotfiles.git)
chezmoi apply
```

---

## Linux環境 (Debian/Ubuntu系想定)

### 一括セットアップスクリプト

ターミナルを開き、以下のスクリプトをコピー＆ペーストして実行してください。必要なパッケージのインストールからdotfilesの適用まで自動で完了します。

```bash
# 1. Git と curl のインストール
sudo apt update && sudo apt install -y git curl

# 2. chezmoi のインストール (公式スクリプトを使用)
sh -c "$(curl -fsLS get.chezmoi.io)"

# 3. インストールされた chezmoi へのパスを通す
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# 4. chezmoi の初期化と適用
chezmoi init [https://github.com/Tat1209/dotfiles.git](https://github.com/Tat1209/dotfiles.git)
chezmoi apply
```

### ステップ別手順

個別に実行する場合は以下の手順に従ってください。

**1. Git のインストール**
ご利用のディストリビューションのパッケージマネージャーを使用してGitをインストールします（例: Debian/Ubuntu系の場合）。
```bash
sudo apt update
sudo apt install git -y
```

**2. chezmoi のインストール**
公式のインストールスクリプトを使用してchezmoiを導入します。
```bash
sh -c "$(curl -fsLS get.chezmoi.io)"
```
※ デフォルトでは `~/.local/bin` または `./bin` にインストールされるため、必要に応じてパスを通してください。

**3. chezmoiの初期化と適用**
対象リポジトリを指定して初期化し、設定を適用します。
```bash
chezmoi init [https://github.com/Tat1209/dotfiles.git](https://github.com/Tat1209/dotfiles.git)
chezmoi apply
```

---

## 補足: 強制適用とステートのリセット (OS共通)

状況に応じて、以下のコマンドを `chezmoi apply` の代わり、または直前に実行してください。

**強制的に適用を行う場合**
```shell
chezmoi apply --force
```

**すべてのステートを完全にリセットして適用する場合**
既存の状態をクリアしてから再適用したい場合に実行します。
```shell
chezmoi init [https://github.com/Tat1209/dotfiles.git](https://github.com/Tat1209/dotfiles.git)
chezmoi state reset
chezmoi apply
```