# dotfiles

本リポジトリは、[chezmoi](https://www.chezmoi.io/) を用いて管理されている環境構築用のdotfilesです。

## セットアップ手順 (Windows環境)

1. **PowerShellの管理者起動**
   キーボードの `Win` + `X` キーを押下後、続いて `A` キーを押し、管理者モードでPowerShell（またはターミナル）を起動します。

2. **実行ポリシーの変更**
   スクリプトの実行を許可するため、以下のコマンドを実行します。
   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

3. **chezmoiの初期化と適用**
   対象リポジトリを指定して初期化し、設定を適用します。
   ```powershell
   chezmoi init https://github.com/Tat1209/dotfiles.git
   chezmoi apply
   ```
   ※強制的に適用を行う場合は、`chezmoi apply` の代わりに `chezmoi apply --force` を実行してください。

   すべてのステートを完全にリセットして適用
   ```powershell
   chezmoi init https://github.com/Tat1209/dotfiles.git
   chezmoi state reset
   chezmoi apply
   ```