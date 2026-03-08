-- lua/plugins/nvim-spider.lua
return {
    'chrisgrieser/nvim-spider',
    lazy = true,
    keys = {
        -- q: 次のサブワード（または通常の単語）の先頭へ
        { "q", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" }, desc = "Next subword/word" },
        -- gq: 前のサブワード（または通常の単語）の先頭へ
        { "gq", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" }, desc = "Previous subword/word" },
    },
    opts = {
        -- true（デフォルト）の場合、連続する記号などをスキップしてしまいます。
        -- false にすることで、通常のVimの単語単位（記号の境界など）でも確実に止まるようになります。
        skipInsignificantPunctuation = false,
    }
}