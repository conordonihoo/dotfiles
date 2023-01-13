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
set nowrap
" cursor location
set cursorline
set ruler
set number
set rnu
" how vim represents characters
set encoding=utf-8
set conceallevel=1
set backspace=indent,eol,start
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
" turn off .viminfo
set viminfo=
" show matching braces
set showmatch
" tree listing
let g:netrw_liststyle= 3
let g:netrw_browse_split= 3
autocmd FileType netrw setl bufhidden=delete
" options for splitting the window
set splitbelow
set splitright
" auto complete
set wildmenu

" remapping keys
noremap H ^
noremap J <C-d>
noremap K <C-u>
noremap L $
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

" default colorscheme
colo winter

" install vim plugin manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" install plugins by executing `:PlugInstall`
call plug#begin('~/.vim')
Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
Plug 'lervag/vimtex'
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0
Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
    let g:tex_conceal='abdmg'
    hi Conceal ctermbg=none
" initialize plugins
call plug#end()
