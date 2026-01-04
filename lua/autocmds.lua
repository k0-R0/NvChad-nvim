require "nvchad.autocmds"
local autocmd = vim.api.nvim_create_autocmd
-- Restore last cursor position when reopening a file
local last_cursor_group = vim.api.nvim_create_augroup("LastCursorGroup", {})
autocmd("BufReadPost", {
    group = last_cursor_group,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Highlight the yanked text for 200ms
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
autocmd("TextYankPost", {
    group = highlight_yank_group,
    pattern = "*",
    callback = function()
        vim.hl.on_yank {
            higroup = "IncSearch",
            timeout = 200,
        }
    end,
})
-- keep indentation to 4 spaces
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "lua" },
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
        vim.opt_local.softtabstop = 4
    end,
})

-- Remove padding and spacings at the edges when switching to full screen
autocmd("VimEnter", {
    command = ":silent !wezterm cli set-padding --left 0 --right 0 --top 0 --bottom 0",
})

autocmd("VimLeavePre", {
    command = ":silent !wezterm cli set-padding --left 20 --right 20 --top 10 --bottom 10",
})
