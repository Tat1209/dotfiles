return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'master', -- 【重要】APIの破壊的変更を避けるため、安定版ブランチを明示的に指定
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    'lua', 'vim', 'vimdoc', 'query', 'python', 'cpp',
                },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end,
    },
}
