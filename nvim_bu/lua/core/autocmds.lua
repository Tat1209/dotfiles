vim.api.nvim_create_autocmd('FileType', {
    pattern = '*', -- すべてのファイルタイプで実行
    callback = function()
    -- vim.opt_local を使い、このバッファでのみ設定を上書きする
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    end,
    desc = "インデントを強制的に4スペースに設定"
})
