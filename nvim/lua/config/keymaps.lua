--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: config/keymaps.lua
-- Description: Key mapping configs
-- Author: Conor Donihoo
-- Close from Neovim with <leader> and q
vim.keymap.set("n", "<leader>q", ":q<CR>", {})
-- Fast saving with <leader> and s
vim.keymap.set("n", "<leader>s", ":w<CR>", {})

-- Reload configuration without restart nvim
vim.keymap.set("n", "<leader>r", ":so %<CR>", {})

-- Telescope
-- <leader> is a space now
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>FF", ":FindFilesHome<CR>", {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>FG", ":GrepFilesHome<CR>", {})
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- NvimTree
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", {}) -- open/close
vim.keymap.set("n", "<leader>nr", ":NvimTreeRefresh<CR>", {}) -- refresh
vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>", {}) -- search file

-- Terminal
vim.keymap.set("n", "<leader>t", ":NeotermOpen<CR>", {})

-- LSP
vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>i", vim.diagnostic.open_float, {})
vim.keymap.set("n", "<leader>I", vim.diagnostic.setloclist, {})
