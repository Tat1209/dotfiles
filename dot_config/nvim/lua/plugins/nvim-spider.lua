-- lua/plugins/spider-and-textobjs.lua (または任意のファイル名)
return {
    -- 1つ目のプラグイン: nvim-spider (移動モーション)
    {
        'chrisgrieser/nvim-spider',
        lazy = true,
        keys = {
            -- q: 次のサブワード（または通常の単語）の先頭へ
            { "q", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" }, desc = "Next subword/word" },
            -- gq: 前のサブワード（または通常の単語）の先頭へ
            { "gq", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" }, desc = "Previous subword/word" },
        },
        opts = {
            skipInsignificantPunctuation = false,
        },
    },
    
    -- 2つ目のプラグイン: nvim-various-textobjs (テキストオブジェクト)
    {
        "chrisgrieser/nvim-various-textobjs",
        lazy = true,
        keys = {
            -- Operator-pending mode ('o') および Visual mode ('x') に対してマッピング
            { "iq", "<cmd>lua require('various-textobjs').subword('inner')<CR>", mode = { "o", "x" }, desc = "inner subword" },
            { "aq", "<cmd>lua require('various-textobjs').subword('outer')<CR>", mode = { "o", "x" }, desc = "outer subword" },
        },
    }
}