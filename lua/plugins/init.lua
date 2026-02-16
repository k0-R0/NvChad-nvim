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
        "sphamba/smear-cursor.nvim",
        lazy = false,
        opts = {
            legacy_computing_symbols_support = false, -- change here
            -- Smear cursor when switching buffers or windows.
            smear_between_buffers = true,

            -- Smear cursor when moving within line or to neighbor lines.
            -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
            smear_between_neighbor_lines = true,

            -- Draw the smear in buffer space instead of screen space when scrolling
            scroll_buffer_space = true,

            -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
            -- Smears and particles will look a lot less blocky.
            legacy_computing_symbols_support = false,

            -- Smear cursor in insert mode.
            -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
            stiffness = 0.8, -- 0.6      [0, 1]
            trailing_stiffness = 0.6, -- 0.45     [0, 1]
            stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
            trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
            damping = 0.95, -- 0.85     [0, 1]
            damping_insert_mode = 0.95, -- 0.9      [0, 1]
            distance_stop_animating = 0.5, -- 0.1      > 0
        },
    },
    {
        "karb94/neoscroll.nvim",
        lazy = false,
        opts = {},
    },
}
