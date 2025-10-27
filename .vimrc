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

" use the system clipboard
set clipboard=unnamed


" searching
set nohlsearch
set incsearch
set ignorecase
set smartcase


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
  set guifont=Source\ Code\ Pro:h16
endif


" netrw settings (more NERDtree-ish)
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 0
let g:netrw_winsize = 30


" set shell
if has('unix')
  let shell='bash'
endif


" custom remaps
nnoremap <C-h> :copen<cr>
nnoremap <C-l> :cclose<cr>
nnoremap <C-j> :cnext<cr>
nnoremap <C-k> :cprev<cr>


" set a new leader key
let mapleader=" "

" tab fast travel
nnoremap <leader>] gt<cr>
nnoremap <leader>[ gT<cr>

" split fast travel
nnoremap <leader>H <C-w>h
nnoremap <leader>J <C-w>j
nnoremap <leader>K <C-w>k
nnoremap <leader>L <C-w>l
nnoremap <leader>Q <C-w>q

" open a file explorer
nnoremap <leader>E :Vex<cr>

" edit/source my .vimrc more easily
nnoremap <leader>ev :tabe ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

" it can be handy to have an in-vim terminal...
if has('terminal')
    " terminal size = 10 lines tall x window width
    set termwinsize=10*0
    nnoremap <leader>T :terminal<cr>
else
    nnoremap <leader>T :bash<cr>
endif


" custom commands
command! -nargs=* Wrap set wrap linebreak nolist
command! -nargs=* Nowrap set nowrap linebreak nolist


" auto commands
augroup ON_WRITE
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END

