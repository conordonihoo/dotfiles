" General ----------------------------------------------------

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
" show matching braces
set showmatch
" options for splitting the window
set splitbelow
set splitright
set noequalalways
" auto complete
set wildmenu
set completeopt=menuone,longest
" syntax highlighting
syntax on
" remember last position in a file
autocmd BufReadPost * silent! normal! g`"zvzb

" GNC --------------------------------------------------------

autocmd bufread *.sm,S_define set syntax=cpp
autocmd bufread *.config*.txt,*/states/* set syntax=config
autocmd bufread Vagrantfile set syntax=ruby

" Remappings -------------------------------------------------

noremap H ^
noremap J <C-d>
noremap K <C-u>
noremap L $
inoremap kj <esc>
inoremap KJ <esc>
nnoremap U <C-e>
nnoremap I <C-y>
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap <C-x>j <C-w>J
nnoremap <C-x>k <C-w>K
nnoremap <C-x>h <C-w>H
nnoremap <C-x>l <C-w>L
nnoremap <C-x>= <C-w>=
nnoremap <C-Down> <C-w>-
nnoremap <C-Up> <C-w>+
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>
" Open/close file tree with \
nnoremap <silent> \ :Lex<CR>:vertical resize 30<CR>
" Open/close fold with zf
nnoremap zf za

" Git Magic --------------------------------------------------------

" git diff
nnoremap <silent> gD :call VimGitDiff()<CR>
function! VimGitDiff()
    :bd
    :silent !git d #
    :e#
    :redraw!
endfunction
if &diff
    set noreadonly
endif
" git add
nnoremap <silent> gA :silent !git add %<CR><CR>:redraw!<CR>:echo resolve(expand('%:p')) "was staged for committing!"<CR>

" netrw File Tree --------------------------------------------------

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_keepdir=0
let g:netrw_altv=1
let g:netrw_list_hide='.*\.swp$'
function! OpenRight()
  :normal v
  let g:path=expand('%:p')
  :q!
  execute 'rightbelow vnew' g:path
  :normal r
endfunction
function! OpenBelow()
  :normal v
  let g:path=expand('%:p')
  :q!
  execute 'rightbelow new' g:path
  :normal r
endfunction
augroup netrw_stuff
  autocmd!
  autocmd filetype netrw nnoremap <buffer> r <C-l>
  autocmd filetype netrw nnoremap <buffer> <C-l> <C-w>l
  autocmd filetype netrw nmap <buffer> = gn
  autocmd filetype netrw nnoremap <buffer> O :call OpenBelow()<CR>
  autocmd filetype netrw nnoremap <buffer> V :call OpenRight()<CR>
  autocmd FileType netrw nnoremap <buffer> ? :he netrw-quickmap<CR>
augroup END

" Auto Complete ----------------------------------------------

inoremap <expr> <Tab> getline('.')[col('.')-2] !~ '^\s\?$' \|\| pumvisible() ? '<C-n>':'<Tab>'
inoremap <expr> <S-Tab> pumvisible() \|\| getline('.')[col('.')-2] !~ '^\s\?$' ? '<C-p>':'<Tab>'
autocmd CmdwinEnter * inoremap <expr> <buffer> <Tab> getline('.')[col('.')-2] !~ '^\s\?$' \|\| pumvisible() ? '<C-x><C-v>':'<Tab>'

" Colorscheme ------------------------------------------------

if (has('termguicolors'))
  set termguicolors
endif
colo spring

" Status Line ------------------------------------------------

if g:colors_name == 'winter'
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
elseif g:colors_name == 'fall' || g:colors_name == 'spring'
    set noshowmode
    set noruler
    set laststatus=2
    set statusline=
    set statusline+=%#CtrlPMode2#%{(mode()=='n')?'\ \ NORMAL\ ':''}
    set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
    set statusline+=%#IncSearch#%{(mode()=='r')?'\ \ RPLACE\ ':''}
    set statusline+=%#DiffDelete#%{(mode()=='v')?'\ \ VISUAL\ ':''}
    set statusline+=%#Pmenu#          " color
    set statusline+=\ %f              " relative path
    set statusline+=\ %m              " modified [+] flag
    set statusline+=%=\               " right align
    set statusline+=%n\               " buffer number
    set statusline+=%#PmenuSbar#      " color
    set statusline+=\ %3l:%-2c\       " line + column
    set statusline+=%<                " truncate from end if too long
endif

" Plugin Manager ---------------------------------------------

"" install vim plugin manager
"let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
"if empty(glob(data_dir . '/autoload/plug.vim'))
"    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif
"" install plugins by executing `:PlugInstall`

" LaTeX Plugins ----------------------------------------------

"set conceallevel=1
"call plug#begin('~/.vim')
"Plug 'sirver/ultisnips'
"    let g:UltiSnipsExpandTrigger = '<n-tab>'
"    let g:UltiSnipsJumpForwardTrigger = '<n-tab>'
"    let g:UltiSnipsJumpBackwardTrigger = '<p-tab>'
"    let g:UltiSnipsSnippetDirectories = ['~/.vim/ultisnips']
"Plug 'lervag/vimtex'
"    let g:tex_flavor='latex'
"    let g:vimtex_view_method='zathura'
"    let g:vimtex_quickfix_mode=0
"Plug 'KeitaNakamura/tex-conceal.vim'
"    set conceallevel=1
"    let g:tex_conceal='abdmg'
"    hi Conceal ctermbg=none
"" initialize plugins
"call plug#end()

" Fuzzy Search Plugin ----------------------------------------

"call plug#begin('~/.vim')
"" <C-p> search for files
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"let g:ctrlp_show_hidden=1
"call plug#end()

" End --------------------------------------------------------
