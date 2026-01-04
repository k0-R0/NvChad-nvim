require "nvchad.options"

-- add yours here!
local o = vim.o
local opt = vim.opt

o.cursorlineopt = "both" -- to enable cursorline!
opt.scrolloff = 10 -- Keep 10 lines above/below cursor
opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor
opt.wrap = false -- Don't wrap lines
opt.relativenumber = true --keep relativenumber on by default
opt.guifont = "Hack Nerd Font:h14" -- use hack nerd font
opt.clipboard = "unnamedplus" -- opt system clipboard
vim.g.clipboard = {
  name = "win32yank-wsl",
  copy = {
    ["+"] = "win32yank -i --crlf",
    ["*"] = "win32yank -i --crlf",
  },
  paste = {
    ["+"] = "win32yank -o --lf",
    ["*"] = "win32yank -o --lf",
  },
  cache_enabled = 0,
}

opt.spelllang = { "en", "de" } -- Set language for spellchecking

-- Tabbing / Indentation
opt.tabstop = 4 -- Tab width
opt.shiftwidth = 4 -- Indent width
opt.softtabstop = 4 -- Soft tab stop
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Smart auto-indenting
opt.autoindent = true -- Copy indent from current line
opt.grepprg = "rg --vimgrep" -- Use ripgrep if available
opt.grepformat = "%f:%l:%c:%m" -- filename, line number, column, content

opt.incsearch = true -- Show matches as you type

-- Visual Settings
opt.termguicolors = true -- Enable 24-bit colors
opt.signcolumn = "yes" -- Always show sign column
opt.guicursor = {
  "n-v-c:block",
  "i-ci-ve:ver25",
  "r-cr:hor20",
  "o:hor50",
}

-- File Handling
opt.autoread = true -- Auto-reload file if changed outside
opt.autowrite = false -- Don't auto-save on some events

opt.iskeyword:append "-"
opt.encoding = "UTF-8" -- Use UTF-8 encoding
