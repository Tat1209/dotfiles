return {
    {
        'echasnovski/mini.ai',
        version = '*',
        -- 依存関係を明記することで、このプラグインより「先に」
        -- nvim-treesitter のロード・インストールが実行されることを構造的に保証する
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = function()
            local ai = require('mini.ai')
            ai.setup({
                mappings = {
                    around_next = '', -- an の操作を無効化
                    inside_next = '', -- in の操作を無効化
                },
                custom_textobjects = {
                    -- n: 数値
                    n = {
                        {
                            -- 1. 指数表記 (例: 6.022e23, -1e-4)
                            '%f[%d%.%-%+][%-%+]?%d+%.?%d*[eE][%-%+]?%d+%f[^%d%.eE]',
                            '%f[%d%.%-%+][%-%+]?%.%d+[eE][%-%+]?%d+%f[^%d%.eE]',
                            
                            -- 2. 浮動小数点・整数 (例: 18, 0.001, -5)
                            '%f[%deE%.%-%+][%-%+]?%d+%.?%d*%f[^%d%.eE]',
                            '%f[%deE%.%-%+][%-%+]?%.%d+%f[^%d%.eE]',
                        },
                        '^().*()$',
                    },
                    
                    -- a: カンマ区切りの要素（引数、リスト要素）
                    a = ai.gen_spec.argument({ separator = ',' }),
                    -- f: 関数定義 (Treesitter)
                    f = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
                    -- c: クラス定義 (Treesitter)
                    c = ai.gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }),
                }
            })
        end,
    }
}