local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang_format" },
        cpp = { "clang_format" },
    },

    formatters = {
        clang_format = {
            args = {
                "--style={IndentWidth: 4, TabWidth: 4, UseTab: Never}",
            },
        },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}
-- format all open buffers in the project
vim.api.nvim_create_user_command("FormatProject", function()
    local conform = require "conform"

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) then
            conform.format {
                bufnr = buf,
                lsp_fallback = true,
            }
        end
    end
end, {})

return options
