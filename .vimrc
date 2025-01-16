" .vimrc
" Bill Israel [http://billisrael.info/]

" general settings
set exrc
set noerrorbells
set nocompatible
set hidden
set encoding=utf-8
set vb
set wildmenu
set showcmd
set backspace=indent,eol,start
set noswapfile
set nowrap
set scrolloff=6
set splitright
set splitbelow
filetype plugin indent on
scriptencoding utf8
fixdel


" searching
set nohlsearch
set incsearch
set ignorecase
set smartcase


" autocomplete
set shortmess+=c
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


" status line
set stl=%f\ %m\ %r\ line\ %l\ of\ %L\ [%p%%],\ column\ %c%=Type:%y
set laststatus=2


" basic ui settings
syntax enable
set background=light
set guicursor="a:block-Cursor,a:blinkwait500-blinkoff250-blinkon250-Cursor/lCursor"
set cmdheight=2
set ruler
set showmatch
set number
set relativenumber
set colorcolumn=80,100


" gui settings
if has('gui_running')
  set mousehide
  set guioptions=Ace
endif


" set shell
if has('unix')
  let shell='bash'
endif


" set a new leader key
let mapleader = " "


" tab fast travel
nnoremap <leader>ll gt<cr>
nnoremap <leader>hh gT<cr>


" misc remaps
if has('terminal')
    nnoremap <leader>T :terminal bash<cr>
else
    nnoremap <leader>T :sh<cr>
endif

nnoremap <leader>ev :tabe ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>


" custom commands
command! -nargs=* Wrap set wrap linebreak nolist
command! -nargs=* Unwrap set nowrap linebreak nolist


" auto commands
augroup ON_WRITE
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END

