return {
    'echasnovski/mini.ai',
    version = '*',
    config = function()
        require('mini.ai').setup({
            mappings = {
                around_next = '',
                inside_next = '',
            },
            custom_textobjects = {
                -- 複数のパターンを配列として渡し、上から順により詳細なパターンを評価させる
                n = {
                    '()%f[%w%.%+-][+-]?%d*%.?%d+[eE][+-]?%d+()', -- 1. 指数表記（例: 1e-4, -5.5E+3）
                    '()%f[%w%.%+-][+-]?%d*%.?%d+()',             -- 2. 浮動小数点数および整数（例: -1.23, .45, 100）
                }
            }
        })
    end,
}
