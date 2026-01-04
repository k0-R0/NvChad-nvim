return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    -- test new blink
    -- { import = "nvchad.blink.lazyspec" },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "c",
                "cpp",
                "lua",
                "vim",
                "vimdoc",
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = false,
            },
        },
    },
    -- Mini nvim plugins
    {
        "nvim-mini/mini.nvim",
        version = "*",
        event = "VeryLazy",
        config = function()
            -- Better text objects (ai, aI, ii, iI, etc.)
            require("mini.ai").setup {
                n_lines = 500,
            }

            -- Surround: ys, ds, cs (like vim-surround but modern)
            require("mini.surround").setup()

            -- Auto pairs: (), {}, [], "", ''
            require("mini.pairs").setup()

            -- Highlight word under cursor
            require("mini.cursorword").setup()

            -- Indentation scope (great with Treesitter)
            require("mini.indentscope").setup {
                symbol = "┆",
                options = { try_as_border = true },
            }
        end,
    },

    {
        "HiPhish/rainbow-delimiters.nvim",
        event = "BufReadPost",
        config = function()
            local rainbow_delimiters = require "rainbow-delimiters"

            vim.g.rainbow_delimiters = {
                strategy = {
                    [""] = rainbow_delimiters.strategy["global"],
                },
                query = {
                    [""] = "rainbow-delimiters",
                },
                highlight = {
                    "RainbowDelimiterRed",
                    "RainbowDelimiterYellow",
                    "RainbowDelimiterBlue",
                    "RainbowDelimiterOrange",
                    "RainbowDelimiterGreen",
                    "RainbowDelimiterViolet",
                    "RainbowDelimiterCyan",
                },
            }
        end,
    },
}
