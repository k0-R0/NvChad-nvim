local null_ls = require "null-ls"

null_ls.setup {
    sources = {
        -- ========================
        -- C / C++
        -- ========================
        null_ls.builtins.diagnostics.clang_tidy,

        -- ========================
        -- Lua
        -- ========================
        null_ls.builtins.diagnostics.luacheck,
    },
}
