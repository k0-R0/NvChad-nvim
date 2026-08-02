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

    --Vim be good
    {
        "ThePrimeagen/vim-be-good",
        cmd = "VimBeGood",
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
                "markdown",
                "markdown-inline",
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

    {
        "karb94/neoscroll.nvim",
        lazy = false,
        config = function()
            local neoscroll = require "neoscroll"

            neoscroll.setup {
                mappings = { "<C-u>", "<C-d>" },
                duration_multiplier = 1.2,
                easing = "quartic",
            }

            -- After scroll, center screen
            local keymap = {
                ["<C-u>"] = function()
                    neoscroll.ctrl_u { duration = 200 }
                    vim.cmd "normal! zz"
                end,
                ["<C-d>"] = function()
                    neoscroll.ctrl_d { duration = 200 }
                    vim.cmd "normal! zz"
                end,
            }

            for key, func in pairs(keymap) do
                vim.keymap.set("n", key, func)
            end
        end,
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        ft = { "markdown" },
        opts = {},
    },
    {
        "amansingh-afk/milli.nvim",
        lazy = false,
        priority = 1000, -- Optional: ensures it loads early for the splash
        config = function()
            require("milli").dashboard {
                splash = "cactus",
                loop = true,
                center = true,
            }
        end,
    },
}
