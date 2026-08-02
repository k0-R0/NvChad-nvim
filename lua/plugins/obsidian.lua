return {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    opts = {
        -- Opt-in to modern command naming (:Obsidian backlinks vs :ObsidianBacklinks)
        legacy_commands = false,

        workspaces = {
            {
                name = "Obsidian-notes",
                path = "~/Documents/Obsidian-notes",
            },
        },

        -- Dictates how new note filenames are created
        note_id_func = function(title)
            local suffix = ""
            if title ~= nil and title ~= "" then
                suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
                for _ = 1, 4 do
                    suffix = suffix .. string.char(math.random(65, 90))
                end
            end
            return tostring(os.time()) .. "-" .. suffix
        end,
    },
    config = function(_, opts)
        require("obsidian").setup(opts)
        -- Set conceallevel when working on markdown files
        vim.opt.conceallevel = 2
    end,
}
