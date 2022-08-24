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
set showmatch

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

" Visual mode pressing # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

" Highlighting
autocmd colorscheme * highlight StatusLine cterm=bold  ctermbg=black
autocmd colorscheme * highlight CursorLine cterm=none  ctermbg=black

syntax on
