return {
    'echasnovski/mini.comment',
    version = '*',
    config = function()
        require('mini.comment').setup({
            options = {},
            mappings = {
                comment = 'gc',
                comment_line = 'gc',
                textobject = 'gC',
            },
            hooks = {},
        })
    end,
}
