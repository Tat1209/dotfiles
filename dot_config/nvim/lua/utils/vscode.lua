local vscode = require('vscode')

local M = {}

M.comment_visual = function()
    -- ==========================================================
    -- 【遅延設定パラメータ (単位: ミリ秒)】
    -- ==========================================================
    local action_delay  = 80
    local escape_delay  = 80
    local restore_delay = 80
    -- ==========================================================

    local initial_cursor = vim.api.nvim_win_get_cursor(0)
    local mode = vim.api.nvim_get_mode().mode
    
    local v1 = vim.fn.line('v')
    local v2 = vim.fn.line('.')
    local c1 = vim.fn.col('v')
    local c2 = vim.fn.col('.')
    
    local start_line = math.min(v1, v2)
    local end_line = math.max(v1, v2)
    
    local total_lines = vim.api.nvim_buf_line_count(0)
    local is_select_all_file = (start_line == 1 and end_line == total_lines)
    
    -- 【修正点1】選択方向（上から下/下から上）を考慮し、視覚的な上端列と下端列を算出
    local top_col, bottom_col
    if v1 < v2 then
        top_col = c1
        bottom_col = c2
    elseif v1 > v2 then
        top_col = c2
        bottom_col = c1
    else
        top_col = math.min(c1, c2)
        bottom_col = math.max(c1, c2)
    end
    
    local end_line_str = vim.api.nvim_buf_get_lines(0, end_line - 1, end_line, true)[1] or ""
    local end_line_length = string.len(end_line_str)
    
    -- 上端の列が1であり、かつ下端の列が行末以上であるかを判定
    local is_select_all_line = (top_col == 1 and bottom_col >= end_line_length)
    
    local is_full_selection = is_select_all_file or is_select_all_line
    
    local function restore_with_scroll()
        pcall(vim.api.nvim_win_set_cursor, 0, {initial_cursor[1], 0})
        vim.defer_fn(function()
            pcall(vim.api.nvim_win_set_cursor, 0, initial_cursor)
        end, restore_delay)
    end

    if mode == 'V' or is_full_selection then
        vscode.call('editor.action.commentLine', { range = { start_line - 1, end_line - 1 } })
        
        vim.defer_fn(function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)
            vim.defer_fn(restore_with_scroll, escape_delay)
        end, action_delay)
    else
        vscode.call('editor.action.blockComment')
        
        vim.defer_fn(function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)
            vim.defer_fn(restore_with_scroll, escape_delay)
        end, action_delay)
        
        -- 【修正点2】フリーズの直接原因となっていたノーマルモードでの `<` キー送信を削除
    end
end

return M