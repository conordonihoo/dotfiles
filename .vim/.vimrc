" Skinny cursor
let &t_SI = "\<esc>[6 q"
let &t_SR = "\<esc>[6 q"
let &t_EI = "\<esc>[6 q"

set background=dark
set cindent
set ruler
set cursorline
set encoding=utf-8
set expandtab
set hlsearch
set ignorecase
set incsearch
set listchars+=tab:\ \
set mouse=a
set nobomb
set novisualbell
set noerrorbells
set nowrap
set number
set shiftwidth=4
set tabstop=4
set viminfo=
set wildignorecase
set smartcase
set rnu
set noswapfile
set t_Co=256
set t_md=
set showmatch

" tree listing
let g:netrw_liststyle= 3
let g:netrw_browse_split= 3
autocmd FileType netrw setl bufhidden=delete

nnoremap H 0
nnoremap J <C-d>
nnoremap K <C-u>
nnoremap L $

inoremap kj <esc>
inoremap KJ <esc>

nnoremap U <C-e>
nnoremap I <C-y>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <C-x>j <C-w>J
map <C-x>k <C-w>K
map <C-x>h <C-w>H
map <C-x>l <C-w>L

" Visual mode pressing * searches for the current selection
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

syntax on

" Colorscheme
colo apprentice
