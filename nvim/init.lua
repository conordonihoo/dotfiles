if vim.fn.has('nvim-0.8') == 0 then
    error('Need Neovim 0.8+ in order to use this config')
end

for _, cmd in ipairs({"git", "rg", {"fd", "fdfind"}}) do
    local name = type(cmd) == "string" and cmd or vim.inspect(cmd)
    local commands = type(cmd) == "string" and {cmd} or cmd
    ---@cast commands string[]
    local found = false

    for _, c in ipairs(commands) do
        if vim.fn.executable(c) == 1 then
            name = c
            found = true
        end
    end

    if not found then
        error(("`%s` is not installed"):format(name))
    end
end

-- START .VIMRC -------------------------------------------------------------------

-- General Settings
vim.opt.cindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.foldlevel = 99
vim.opt.foldmethod = 'indent'
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.encoding = 'utf-8'
vim.opt.backspace = 'indent,eol,start'
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.wildignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = 'a'
vim.opt.bomb = false
vim.opt.visualbell = false
vim.opt.errorbells = false
vim.opt.showmatch = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.equalalways = false
vim.opt.wildmenu = true
vim.opt.completeopt = 'menuone,longest'

-- Syntax highlighting
vim.cmd('syntax on')

-- Remember last position in a file
vim.cmd([[
  autocmd BufReadPost * silent! normal! g`"zvzb
]])

-- GNC
vim.cmd([[
  autocmd BufRead *.sm,S_define set syntax=cpp
  autocmd BufRead *.config*.txt,*/states/* set syntax=config
  autocmd BufRead Vagrantfile set syntax=ruby
]])

-- Remappings
local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', 'H', '^')
map('n', 'J', '<C-d>')
map('n', 'K', '<C-u>')
map('n', 'L', '$')
map('v', 'H', '^')
map('v', 'J', '<C-d>')
map('v', 'K', '<C-u>')
map('v', 'L', '$')
map('i', 'kj', '<Esc>')
map('i', 'KJ', '<Esc>')
map('n', 'U', '<C-e>')
map('n', 'I', '<C-y>')
map('n', '<C-j>', '<C-W>j')
map('n', '<C-k>', '<C-W>k')
map('n', '<C-h>', '<C-W>h')
map('n', '<C-l>', '<C-W>l')
map('n', '<C-x>j', '<C-w>J')
map('n', '<C-x>k', '<C-w>K')
map('n', '<C-x>h', '<C-w>H')
map('n', '<C-x>l', '<C-w>L')
map('n', '<C-x>=', '<C-w>=')
map('n', '<C-Down>', '<C-w>-')
map('n', '<C-Up>', '<C-w>+')
map('n', '<C-Left>', '<C-w><')
map('n', '<C-Right>', '<C-w>>')
map('n', 'zf', 'za')

-- Status Line

vim.cmd([[
  set noshowmode
  set noruler
  set laststatus=2
  set statusline=
  set statusline+=%#PmenuSel#%{(mode()=='n')?'\ \ NORMAL\ ':''}
  set statusline+=%#ModeMsg#%{(mode()=='i')?'\ \ INSERT\ ':''}
  set statusline+=%#DiffText#%{(mode()=='r')?'\ \ RPLACE\ ':''}
  set statusline+=%#DiffDelete#%{(mode()=='v')?'\ \ VISUAL\ ':''}
  set statusline+=%#Pmenu#          " color
  set statusline+=\ %f              " relative path
  set statusline+=\ %m              " modified [+] flag
  set statusline+=%=\               " right align
  set statusline+=%n\               " buffer number
  set statusline+=%#IncSearch#      " color
  set statusline+=\ %3l:%-2c\       " line + column
  set statusline+=%<                " truncate from end if too long
]])

-- END .VIMRC ---------------------------------------------------------------------

-- Load main config
require("config")
