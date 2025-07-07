-- 折り返し時に表示行単位で移動
vim.keymap.set({'n'}, 'j', 'gj')
vim.keymap.set({'n'}, 'k', 'gk')

-- 高速移動
vim.keymap.set({'n', 'v'}, 'H', '12h')
vim.keymap.set({'n', 'v'}, 'J', '3gj')
vim.keymap.set({'n', 'v'}, 'K', '3gk')
vim.keymap.set({'n', 'v'}, 'L', '12l')

-- インデント
vim.keymap.set({'n'}, '>', '>>')
vim.keymap.set({'n'}, '<', '<<')

-- vim.keymap.set({'v'}, '>', '>gv')
-- vim.keymap.set({'v'}, '<', '<gv')
local function indent_with_reselect(key) -- 遅延入れないとバグる
vim.cmd('normal! ' .. key)
vim.defer_fn(function() vim.cmd('normal! gv') end, 150)
end
vim.keymap.set({'v'}, '>', function() indent_with_reselect('>') end, { desc = "インデントして再選択" })
vim.keymap.set({'v'}, '<', function() indent_with_reselect('<') end, { desc = "インデントして再選択" })

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
vim.keymap.set({'n'}, 'z', '"_d')                 -- zキーをブラックホールレジスタのプレフィックスに

vim.keymap.set({'v'}, '<BS>', '"_d')
vim.keymap.set({'v'}, '<Del>', '"_d')
vim.keymap.set({'v'}, 'x', '"_d')
vim.keymap.set({'v'}, 's', '"_di')

vim.keymap.set({'n'}, 'Y', 'v$hy') -- Yで改行を含まずに行末までヤンクする
vim.keymap.set({'v'}, 'y', 'y`>') -- ヤンク後の位置を維持
vim.keymap.set({'v'}, 'p', '"_dP') -- ビジュアルモードで選択範囲をヤンクせずに入れ替える形でペーストする
vim.keymap.set({'v'}, 'P', '"_dP') -- ビジュアルモードで選択範囲をヤンクせずに入れ替える形でペーストする
vim.keymap.set({'n'}, '@', '"_Dp') -- 行末までを上書き
vim.keymap.set({'n'}, '`', '"_Dp') -- 行末までを上書き

-- ここからは，VSCodeの拡張機能側で，別途設定の必要あり
-- 行頭・行末へ移動
vim.keymap.set({'i'}, '<C-h>', '<Esc>I')
vim.keymap.set({'i'}, '<C-l>', '<Esc>A')
vim.keymap.set({'n'}, '<C-h>', '^')
vim.keymap.set({'n'}, '<C-l>', '$')
vim.keymap.set({'n'}, '<C-j>', 'J')
vim.keymap.set({'n'}, '<C-k>', 'k"xdd"xpkJ')

-- カーソル位置を変更
vim.keymap.set({'n'}, 'm', '<C-o>') -- カーソル位置を変更
vim.keymap.set({'n'}, 'M', '<C-i>') -- カーソル位置を変更

if vim.g.vscode then
    -- VSCode Neovimによるコメントアウトのトグル機能を無効化
    vim.keymap.del({'x', 'n'}, 'gc')
    vim.keymap.del({'n'}, 'gcc')
else
    -- VSCode を使わない場合のキーマップ設定
    -- で挿入モードを抜ける
    vim.keymap.set({'i'}, 'jk', '<Esc>', { desc = 'Escape insert mode' })
    vim.keymap.set({'i'}, 'kj', '<Esc>', { desc = 'Escape insert mode' })
    vim.keymap.set({'i'}, 'JK', '<Esc>', { desc = 'Escape insert mode' })
    vim.keymap.set({'i'}, 'KJ', '<Esc>', { desc = 'Escape insert mode' })

    -- Ctrl + s でファイルを保存
    vim.keymap.set({'n', 'i', 'v'}, '<C-s>', '<cmd>w<cr>', { desc = 'Save file' })
end
