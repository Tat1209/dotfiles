# dotfiles

本リポジトリは、[chezmoi](https://www.chezmoi.io/) を用いて管理されている環境構築用のdotfilesです。

## 1. 前提条件 (Gitのインストール)

chezmoiによるリポジトリの初期化および管理にはGitが必要です。各OSの標準的なパッケージマネージャーを使用してインストールします。

### Windows環境
`winget` コマンドを使用して公式パッケージをインストールします。PowerShellまたはターミナルを開き、以下を実行してください。
```powershell
winget install --id Git.Git -e --source winget
```

### Linux環境
ご利用のディストリビューションのパッケージマネージャーを使用してインストールします。
（例: Debian/Ubuntu系の場合）
```bash
sudo apt update
sudo apt install git -y
```

## 2. OS別の事前設定

OSごとに、chezmoiを実行する前の環境準備を行います。

### Windows環境
PowerShellでスクリプトの実行を許可するための権限変更が必要です。

1. **PowerShellの管理者起動**
   キーボードの `Win` + `X` キーを押下後、`A` キーを押し、管理者モードでPowerShell（またはターミナル）を起動します。
2. **実行ポリシーの変更**
   以下のコマンドを実行し、現在のユーザーに対する実行権限を付与します。
   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

### Linux環境
特有の事前設定は不要ですが、chezmoi自体のインストールが済んでいない場合は、公式のインストールスクリプト等を使用して導入してください。
```bash
sh -c "$(curl -fsLS get.chezmoi.io)"
```

## 3. chezmoiの初期化と適用 (共通手順)

事前設定完了後、以下の手順でdotfilesを適用します。この手順はWindows（PowerShell）およびLinux（ターミナル）で共通です。

**通常の初期化と適用**
対象リポジトリを指定して初期化し、設定を適用します。
```shell
chezmoi init [https://github.com/Tat1209/dotfiles.git](https://github.com/Tat1209/dotfiles.git)
chezmoi apply
```
※強制的に適用を行う場合は、`chezmoi apply` の代わりに `chezmoi apply --force` を実行してください。

**すべてのステートを完全にリセットして適用**
既存の状態をクリアしてから再適用する場合は以下の順で実行します。
```shell
chezmoi init [https://github.com/Tat1209/dotfiles.git](https://github.com/Tat1209/dotfiles.git)
chezmoi state reset
chezmoi apply
```