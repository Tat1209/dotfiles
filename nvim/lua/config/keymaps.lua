-- Esc連打でハイライト解除
vim.keymap.set({'n'}, '<Esc><Esc>', '<cmd>nohlsearch<cr>', { desc = 'Clear search highlight', silent = true })

-- カーソル移動
if vim.g.vscode then
    -- folding が展開されないように，VSCode の行移動を優先 J,K で{'v'}はうまくいかんかった
    -- CursorMoveでは展開されるため力業
    vim.keymap.set({'n'}, 'j', "<Cmd>call VSCodeCall('cursorDown')<CR>", opts)
    vim.keymap.set({'n'}, 'k', "<Cmd>call VSCodeCall('cursorUp')<CR>", opts)
    vim.keymap.set({'n'}, 'J', "<Cmd>call VSCodeCall('cursorDown')<CR><Cmd>call VSCodeCall('cursorDown')<CR><Cmd>call VSCodeCall('cursorDown')<CR>", opts)
    vim.keymap.set({'n'}, 'K', "<Cmd>call VSCodeCall('cursorUp')<CR><Cmd>call VSCodeCall('cursorUp')<CR><Cmd>call VSCodeCall('cursorUp')<CR>", opts)
    vim.keymap.set({'v'}, 'J', '3gj')
    vim.keymap.set({'v'}, 'K', '3gk')
else
    vim.keymap.set({'n'}, 'j', 'gj')
    vim.keymap.set({'n'}, 'k', 'gk')
    vim.keymap.set({'n', 'v'}, 'J', '3gj')
    vim.keymap.set({'n', 'v'}, 'K', '3gk')
end
vim.keymap.set({'n', 'v'}, 'H', '^')
vim.keymap.set({'n', 'v'}, 'L', '$')

-- インデント
vim.keymap.set({'n'}, '>', '>>')
vim.keymap.set({'n'}, '<', '<<')

-- まとめてインデント
if not vim.g.vscode then
    vim.keymap.set({'v'}, '>', '>gv')
    vim.keymap.set({'v'}, '<', '<gv')
    -- VSCodeのはVSCode側で制御
end

-- 処理時にカーソルが移動しないように
vim.keymap.set({'n'}, '*', 'mx*`x')
vim.keymap.set({'n'}, '.', 'mx.`x')
vim.keymap.set({'v'}, '*', [[<Esc>mxgv"xy<Cmd>let @/ = '\V' . escape(@x, '\/')<CR><Cmd>set hlsearch<CR>`x]], { desc = 'Search visual selection without moving' })
vim.keymap.set({'v'}, '.', [[<Esc>mx<Cmd>'<,'>normal! .<CR>`x]], { desc = 'Repeat change on visual selection without moving' })


-- 文字を削除してもヤンクしないようにする設定
vim.keymap.set({'n'}, '<CR>', 'o<Esc>')
vim.keymap.set({'n'}, '<BS>', '"_dh')             -- Backspaceでカーソル前の1文字を削除
vim.keymap.set({'n'}, '<Del>', 'mxi<Del><Esc>`x') -- Deleteでカーソル上の1文字を削除（カーソル位置は維持）
vim.keymap.set({'n'}, 'x', 'mxi<Del><Esc>`x')     -- Deleteでカーソル上の1文字を削除（カーソル位置は維持）
vim.keymap.set({'n'}, 's', '"_s')                 -- sキーで1文字削除してインサートモードへ

vim.keymap.set({'v'}, '<BS>', '"_d')
vim.keymap.set({'v'}, '<Del>', '"_d')
vim.keymap.set({'v'}, 'x', '"_d')
vim.keymap.set({'v'}, 's', '"_c')

vim.keymap.set({'n'}, 'Y', 'v$hy') -- Yで改行を含まずに行末までヤンクする
vim.keymap.set({'v'}, 'y', 'y`>') -- ヤンク後の位置を維持
vim.keymap.set({'v'}, 'p', '"_dP') -- ビジュアルモードで選択範囲をヤンクせずに入れ替える形でペーストする
vim.keymap.set({'v'}, 'P', '"_dP') -- ビジュアルモードで選択範囲をヤンクせずに入れ替える形でペーストする
vim.keymap.set({'n'}, '@', '"_Dp') -- 行末までを上書き
vim.keymap.set({'n'}, '`', '"_Dp') -- 行末までを上書き

vim.keymap.set({'n'}, 'dx', '"_dd') -- Normal-mode: dx で行全体をレジスタに保存せず削除
vim.keymap.set({'n'}, 'cx', '"_cc') -- Normal-mode: cx で行全体をレジスタに保存せず削除

-- カーソル位置を変更
vim.keymap.set({'n'}, 'm', '<C-o>')
vim.keymap.set({'n'}, 'M', '<C-i>')

if vim.g.vscode then
    -- VSCode Neovimによるコメントアウトのトグル機能を無効化 やっぱ必要っぽい 2026-03-08
    vim.keymap.del({'x', 'n'}, 'gc')
    vim.keymap.del({'n'}, 'gcc')
end

-- jk で挿入モードを抜ける
if not vim.g.vscode then
    vim.keymap.set({'i'}, 'jk', '<Esc>')
    vim.keymap.set({'i'}, 'kj', '<Esc>')
    vim.keymap.set({'i'}, 'JK', '<Esc>')
    vim.keymap.set({'i'}, 'KJ', '<Esc>')
end

-- Ctrl + s でファイルを保存
if not vim.g.vscode then
    vim.keymap.set({'n', 'i', 'v'}, '<C-s>', '<cmd>w<cr>', { desc = 'Save file' })
end

-- ここからは，VSCodeの拡張機能側で，ctrlキーを適用する必要あり
-- 行統合
vim.keymap.set({'n'}, '<C-j>', 'J')
vim.keymap.set({'n'}, '<C-J>', 'gJ')
vim.keymap.set({'n'}, '<C-k>', 'k"xdd"xpkJ')
