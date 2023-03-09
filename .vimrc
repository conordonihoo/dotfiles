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
" auto complete
inoremap a a<C-n><C-p>
inoremap b b<C-n><C-p>
inoremap c c<C-n><C-p>
inoremap d d<C-n><C-p>
inoremap e e<C-n><C-p>
inoremap f f<C-n><C-p>
inoremap g g<C-n><C-p>
inoremap h h<C-n><C-p>
inoremap i i<C-n><C-p>
inoremap j j<C-n><C-p>
inoremap k k<C-n><C-p>
inoremap l l<C-n><C-p>
inoremap m m<C-n><C-p>
inoremap n n<C-n><C-p>
inoremap o o<C-n><C-p>
inoremap p p<C-n><C-p>
inoremap q q<C-n><C-p>
inoremap r r<C-n><C-p>
inoremap s s<C-n><C-p>
inoremap t t<C-n><C-p>
inoremap u u<C-n><C-p>
inoremap v v<C-n><C-p>
inoremap w w<C-n><C-p>
inoremap x x<C-n><C-p>
inoremap y y<C-n><C-p>
inoremap z z<C-n><C-p>
inoremap A A<C-n><C-p>
inoremap B B<C-n><C-p>
inoremap C C<C-n><C-p>
inoremap D D<C-n><C-p>
inoremap E E<C-n><C-p>
inoremap F F<C-n><C-p>
inoremap G G<C-n><C-p>
inoremap H H<C-n><C-p>
inoremap I I<C-n><C-p>
inoremap J J<C-n><C-p>
inoremap K K<C-n><C-p>
inoremap L L<C-n><C-p>
inoremap M M<C-n><C-p>
inoremap N N<C-n><C-p>
inoremap O O<C-n><C-p>
inoremap P P<C-n><C-p>
inoremap Q Q<C-n><C-p>
inoremap R R<C-n><C-p>
inoremap S S<C-n><C-p>
inoremap T T<C-n><C-p>
inoremap U U<C-n><C-p>
inoremap V V<C-n><C-p>
inoremap W W<C-n><C-p>
inoremap X X<C-n><C-p>
inoremap Y Y<C-n><C-p>
inoremap Z Z<C-n><C-p>
inoremap <tab> <C-n>
inoremap <C-[> <C-e>

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
    let g:UltiSnipsExpandTrigger = '<n-tab>'
    let g:UltiSnipsJumpForwardTrigger = '<n-tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<p-tab>'
    let g:UltiSnipsSnippetDirectories = ['~/.vim/ultisnips']
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
