--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: config/options.lua
-- Description: General Neovim settings and configuration
-- Author: Conor Donihoo
local cmd = vim.cmd
-- Set options (global/buffer/windows-scoped)
local opt = vim.opt
-- Global variables
local g = vim.g
local s = vim.s
local indent = 4

cmd([[
  filetype plugin indent on
]])

opt.clipboard = "unnamedplus" -- allow neovim to access the system clipboard
opt.matchpairs = {"(:)", "{:}", "[:]", "<:>"}

-- indention
opt.autoindent = true -- auto indentation
opt.shiftwidth = indent -- the number of spaces inserted for each indentation
opt.smartindent = true -- make indenting smarter
opt.softtabstop = indent -- when hitting <BS>, pretend like a tab is removed, even if spaces
opt.tabstop = indent -- insert 2 spaces for a tab
opt.shiftround = true -- use multiple of shiftwidth when indenting with "<" and ">"

-- ui
opt.list = true
-- You can also add "space" or "eol", but I feel it"s quite annoying
opt.listchars = {
    tab = "┊ ",
    trail = "·",
    extends = "»",
    precedes = "«",
    nbsp = "×"
}

-- Hide cmd line
opt.cmdheight = 1 -- more space in the neovim command line for displaying messages

opt.scrolloff = 5 -- minimal number of screen lines to keep above and below the cursor
opt.sidescrolloff = 3 -- minimal number of screen columns to keep to the left and right (horizontal) of the cursor if wrap is `false`
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time

-- backups
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- autocomplete
opt.shortmess = opt.shortmess + {
    c = true
} -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"

-- perfomance
-- remember N lines in history
opt.history = 100 -- keep 100 lines of history
opt.redrawtime = 1500
opt.timeoutlen = 250 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.ttimeoutlen = 10
opt.updatetime = 100 -- signify default updatetime 4000ms is not good for async update

-- theme
opt.termguicolors = true -- enable 24-bit RGB colors

-- persistent undo
-- Don"t forget to create folder $HOME/.local/share/nvim/undo
local undodir = vim.fn.stdpath("data") .. "/undo"
opt.undofile = true -- enable persistent undo
opt.undodir = undodir
opt.undolevels = 1000
opt.undoreload = 10000

-- Disable builtin plugins
local disabled_built_ins = {"2html_plugin", "getscript", "getscriptPlugin", "gzip", "logipat", "netrw", "netrwPlugin",
                            "netrwSettings", "netrwFileHandlers", "matchit", "tar", "tarPlugin", "rrhelper",
                            "spellfile_plugin", "vimball", "vimballPlugin", "zip", "zipPlugin", "tutor", "rplugin",
                            "synmenu", "optwin", "compiler", "bugreport", "ftplugin"}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

-- LSP options
vim.diagnostic.config({
    virtual_text = false,  -- Disable virtual text
    underline = false,     -- Disable underlines
})

-- Gitsigns highlighting
cmd([[
    highlight GitSignsAddPreview guibg=#2b625f
    highlight GitSignsAddInline guibg=#3b9754
    highlight GitSignsDeletePreview guibg=#7f585f
    highlight GitSignsDeleteInline guibg=#df5353
]])

-- vimdiff highlighting
cmd([[
    autocmd VimEnter * highlight DiffAdd guibg=#2b625f
    autocmd VimEnter * highlight DiffDelete guibg=#7f585f
    autocmd VimEnter * highlight DiffText guibg=#cdbc4e
]])


-- Colorscheme
cmd.colorscheme("rose-pine")
--cmd.colorscheme("kanagawa")
--cmd.colorscheme("gruvbox-material")
