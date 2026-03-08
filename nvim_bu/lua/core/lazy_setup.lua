-- install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'echasnovski/mini.comment',
        version = '*', -- `mini.nvim`ではバージョン指定が推奨されています
        config = function()
            require('mini.comment').setup({
                options = {},
                mappings = {
                    comment = 'gc', -- Operator-pending/visualモードでのコメント
                    comment_line = 'gc', -- Normalモードでの行コメント
                    textobject = 'gC', -- テキストオブジェクトとの競合を回避
                },
                hooks = {},
            })
        end,
    },
    {
        'echasnovski/mini.ai',
        version = '*', -- or 'dev'
        config = function()
            local gen_spec = require('mini.ai').gen_spec
            require('mini.ai').setup({
                mappings = {
                    around_next = '', -- 'an'を無効化
                    inside_next = '', -- 'in'を無効化
                },
                custom_textobjects = {
                    -- n = { '()%f[%d]%d+()' },
                    -- n = { '()%f[-+%d][+-]?%d+()' }
                    -- n = { '()%f[-+.%d][+-]?%d*%.?%d+()' }
                    -- n = { '()%f[-+.%d][+-]?%d*%.?%d+([eE][+-]?%d+)?()' }

                    -- n = {
                    --     {
                    --         '%f[-+.%d][+-]?%d*%.?%d+',
                    --         '%f[-+.%deE][+-]?%d*%.?%d+[eE][+-]?%d+',
                    --     },
                    --     '^().*()$'
                    -- }

                    n = { '()%f[-+.%deE][+-]?%d*%.?%d+[eE]?[+-]?%d+()' }
            }
            })
        end,
    },
})
