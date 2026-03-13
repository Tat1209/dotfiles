-- 基本設定
vim.opt.swapfile = false            -- スワップファイルを作成しない
vim.opt.hidden = true               -- バッファが編集中でも他のファイルを開ける
vim.opt.autoread = true             -- ファイルが外部で変更されたら自動で読み直す
vim.opt.whichwrap = 'b,s,h,l,<,>,[,],~' -- 行の折り返しや移動を許可するキーを設定
vim.opt.backspace = 'indent,eol,start' -- バックスペースの挙動を設定

-- インデント設定
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- vim.opt.autoindent = true
-- vim.opt.smartindent = true
vim.opt.expandtab = true

-- 見た目関連
vim.opt.laststatus = 2              -- ステータスラインはNeovimのモード表示に便利なため残す
vim.opt.showcmd = true              -- 入力中のコマンド表示

-- 検索・ハイライト関連
vim.opt.hlsearch = true
-- vim.opt.incsearch = true            -- Neovimのデフォルトで不要
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true            -- 対応する括弧のハイライト

if vim.g.vscode then
    -- VSCodeNeovim環境用設定
    vim.opt.foldenable = false
    vim.opt.foldopen:remove({"jump", "search", "mark"})
    
else
    -- 通常のNeovim環境用設定
    vim.opt.clipboard = 'unnamedplus'   -- OSのクリップボードと共有
    vim.opt.mouse = 'a'                 -- VSCodeがマウスを処理するため不要
    vim.opt.backup = false              -- Neovimのデフォルトで不要
    vim.opt.number = true               -- VSCodeの機能で表示するため不要
    vim.opt.cursorline = true           -- VSCodeの機能で表示するため不要
    vim.opt.termguicolors = true        -- VSCode環境では不要
end
