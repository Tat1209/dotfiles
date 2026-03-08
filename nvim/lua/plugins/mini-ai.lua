-- lua/plugins/mini-ai.lua
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
                -- q: サブワード
                -- () で境界を明示し、%f で誤検知（Nekoの中のeko等）を防ぎます
                q = {
                    {
                        '()%u[%l%d]+()',       -- 1. CamelCase (例: NekoNyan の Neko)
                        '()%f[%a]%l+%f[^%l]()',-- 2. 小文字 (例: nemu. %f[%a]により eko 等を排除)
                        '()%f[%d]%d+%f[^%d]()',-- 3. 数字 (例: 123)
                        '()%f[%a]%u+%f[^%u]()',-- 4. 大文字の連続 (例: JSON)
                    }
                },
                
                -- n: 数値
                -- 競合を防ぐため、指数・小数・整数すべてを1つの式で評価させます
                -- AdamWやSGDの学習率（1e-4 等）の全体を確実に捉えます
                n = {
                    '()%f[%w%.%+-][-+]?%d*%.?%d+[eE]?[-+]?%d*%f[^%w%.%+-]()',
                }
            }
        })
    end,
}