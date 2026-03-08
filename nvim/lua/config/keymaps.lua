-- 折り返し時に表示行単位で移動
vim.keymap.set({'n'}, 'j', 'gj')
vim.keymap.set({'n'}, 'k', 'gk')

-- インデント
vim.keymap.set({'n'}, '>', '>>')
vim.keymap.set({'n'}, '<', '<<')

-- 処理時にカーソルが移動しないように
vim.keymap.set({'n'}, '*', 'mx*`x')
vim.keymap.set({'n'}, '.', 'mx.`x')

-- Esc連打でハイライト解除
vim.keymap.set({'n'}, '<Esc><Esc>', '<cmd>nohlsearch<cr>', { desc = 'Clear search highlight', silent = true })

-- ノーマルモードからの編集設定
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


-- ここからは，VSCodeの拡張機能側で，ctrlキーを適用する必要あり
vim.keymap.set({'n'}, '<C-j>', 'J')
vim.keymap.set({'n'}, '<C-k>', 'k"xdd"xpkJ')

-- カーソル位置を変更
vim.keymap.set({'n'}, 'm', '<C-o>')
vim.keymap.set({'n'}, 'M', '<C-i>')


if vim.g.vscode then
    -- VSCode Neovimによるコメントアウトのトグル機能を無効化
    vim.keymap.del({'x', 'n'}, 'gc')
    vim.keymap.del({'n'}, 'gcc')
    -- folding が展開されないように，VSCode の行移動を優先
    vim.keymap.del({'n'}, 'j')
    vim.keymap.del({'n'}, 'k')
    vim.keymap.set({'n'}, 'j', "<Cmd>call VSCodeCall('cursorDown')<CR>", opts)
    vim.keymap.set({'n'}, 'k', "<Cmd>call VSCodeCall('cursorUp')<CR>", opts)
    -- vim.keymap.set({'n'}, 'J', "<Cmd>call VSCodeCall('cursorDown')<CR><Cmd>call VSCodeCall('cursorDown')<CR><Cmd>call VSCodeCall('cursorDown')<CR>", opts)
    -- vim.keymap.set({'n'}, 'K', "<Cmd>call VSCodeCall('cursorUp')<CR><Cmd>call VSCodeCall('cursorUp')<CR><Cmd>call VSCodeCall('cursorUp')<CR>", opts)

else
    -- カーソル移動
    vim.keymap.set({'n', 'v'}, 'H', '^')
    -- vim.keymap.set({'n', 'v'}, 'J', '3gj')
    -- vim.keymap.set({'n', 'v'}, 'K', '3gk')
    vim.keymap.set({'n', 'v'}, 'L', '$')

    -- jk で挿入モードを抜ける
    vim.keymap.set({'i'}, 'jk', '<Esc>')
    vim.keymap.set({'i'}, 'kj', '<Esc>')
    vim.keymap.set({'i'}, 'JK', '<Esc>')
    vim.keymap.set({'i'}, 'KJ', '<Esc>')

    -- Ctrl + s でファイルを保存
    vim.keymap.set({'n', 'i', 'v'}, '<C-s>', '<cmd>w<cr>', { desc = 'Save file' })

    -- まとめてインデント
    vim.keymap.set({'v'}, '>', '>gv')
    vim.keymap.set({'v'}, '<', '<gv')

    -- エディタ移動
    -- vim.keymap.set({'n'}, '<C-h>', '<Cmd>bprevious<CR>', { desc = 'Previous buffer' })
    -- vim.keymap.set({'n'}, '<C-l>', '<Cmd>bnext<CR>', { desc = 'Next buffer' })
    
    -- エディタグループ移動
    vim.keymap.set({'n'}, '<C-h>', '<C-w>h', { desc = 'Move to left window' })
    vim.keymap.set({'n'}, '<C-l>', '<C-w>l', { desc = 'Move to right window' })

end
