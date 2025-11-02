" .vimrc
" Bill Israel [http://billisrael.info/]

" general settings
set noerrorbells
set nocompatible
set hidden
set encoding=utf-8
set vb
set wildmenu
set noshowmode
set backspace=indent,eol,start
set noswapfile
set nowrap
set scrolloff=6
set splitright
set splitbelow
filetype plugin indent on
scriptencoding utf-8
fixdel


" searching
set nohlsearch
set incsearch
set ignorecase
set smartcase

" update path to always do recursive searching from cwd
set path+=,**

" use silver searcher instead of grep, if available
if executable('ag')
    set grepprg=ag\ --vimgrep\ $*
    set grepformat^=%f:%l:%c:%m
endif


" autocomplete
set shortmess+=ac
set completeopt=menuone,longest,preview

if has('textprop')
    set completeopt+=popup
endif


" indentation
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab


" basic ui settings
syntax on
set termguicolors
set signcolumn=yes
set updatetime=250
set cmdheight=2
set noruler
set showmatch
set number
set relativenumber
set colorcolumn=80,100
silent! colorscheme rosepine_dawn

" for the rare cases i run this in a gui
if has('gui_running')
  set mousehide
  set guioptions=c
  set guifont=Source\ Code\ Pro:h16
endif

" status line
let g:currentmode={
    \ 'n'  : 'NORMAL',
    \ 'no' : 'NORMAL,OP',
    \ 'v'  : 'VISUAL',
    \ 'V'  : 'V-LINE',
    \ '^V' : 'V-BLOCK',
    \ 's'  : 'SELECT',
    \ 'S'  : 'S-LINE',
    \ '^S' : 'S-BLOCK',
    \ 'i'  : 'INSERT',
    \ 'R'  : 'REPLACE',
    \ 'Rv' : 'V-REPLACE',
    \ 'c'  : 'COMMAND',
    \ 'cv' : 'VIM EX',
    \ 'ce' : 'EX',
    \ 'r'  : 'PROMPT',
    \ 'rm' : 'MORE',
    \ 'r?' : 'CONFIRM',
    \ '!'  : 'SHELL',
    \ 't'  : 'TERMINAL'
    \}

set statusline=
set statusline+=\ %{g:currentmode[mode()]}      " current mode
set statusline+=\ %#StatusFile#\ %<%F           " full path
set statusline+=%m                              " modified?
set statusline+=%=%*                            " right align
set statusline+=\ %l/%L:%v                      " line & column numbers
set statusline+=\ %y                            " filetype
set laststatus=2


" netrw settings (more NERDtree-ish)
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_altv = 1
let g:netrw_winsize = 30


" set a new leader key
let mapleader=" "

" tab fast travel
nnoremap <leader>] gt<cr>
nnoremap <leader>[ gT<cr>

" open a file explorer
nnoremap <leader>E :Lex<cr>

" edit/source my .vimrc more easily
nnoremap <leader>ev :tabe ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

" custom remaps
nnoremap <leader>j :cnext<cr>
nnoremap <leader>k :cprev<cr>


" it can be handy to have an in-vim terminal...
if has('terminal')
    " terminal size = 12 lines tall x window width
    set termwinsize=12*0
    nnoremap <leader>T :terminal<cr>
endif


" custom commands
command! -nargs=* Wrap set wrap linebreak nolist
command! -nargs=* Nowrap set nowrap linebreak nolist


" auto commands
augroup ON_WRITE
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END

