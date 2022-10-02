" Skinny cursor
let &t_SI = "\<esc>[6 q"
let &t_SR = "\<esc>[6 q"
let &t_EI = "\<esc>[6 q"

" disable background color erase (BCE)
set t_ut=
" 256 colors
set t_Co=256
" no bold
set t_md=
" indent options
set cindent
set shiftwidth=4
set tabstop=4
set expandtab
set listchars+=tab:\ \ 
set foldlevel=99
set foldmethod=indent
" cursor location
set cursorline
set ruler
set number
set rnu
" how vim represents characters
set encoding=utf-8
set conceallevel=1
" search options
set hlsearch
set ignorecase
set incsearch
set wildignorecase
set smartcase
" use the mouse
set mouse=a
" remove a file's BOM
set nobomb
" no annoying bells
set novisualbell
set noerrorbells
" turn off word wrapping
set nowrap
" turn off .viminfo
set viminfo=
" turn off swap files
set noswapfile
" show matching braces
set showmatch
" tree listing
let g:netrw_liststyle= 3
let g:netrw_browse_split= 3
autocmd FileType netrw setl bufhidden=delete
" options for splitting the window
set splitbelow
set splitright

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

" syntax highlighting
syntax on

" Colorscheme
colo apprentice
