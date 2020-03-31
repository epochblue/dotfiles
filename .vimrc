" .vimrc
" Bill Israel [http://cubicle17.com/]

" general settings
set nocompatible
set hidden
set modelines=0
set encoding=utf-8
set vb
set wildmenu
set showcmd
set backspace=indent,eol,start
set noswapfile
filetype plugin indent on
scriptencoding utf8
fixdel

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" indentation
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" code folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" status line
set stl=%f\ %m\ %r\ line\ %l\ of\ %L\ [%p%%],\ column\ %c%=Type:%y
set laststatus=2

" baseline ui settings
" default non-gui colorscheme = desert, but prefer solarized
colorscheme desert
set cmdheight=2
set ruler
set showmatch
set number
syntax on

" relative line numbering
if exists('&relativenumber')
  set relativenumber
endif

" gui settings
if has('gui_running')
  hi CursorLine guibg=#606060
  " default colorscheme = desert, but prefer solarized
  colorscheme desert
  silent! colorscheme solarized
  set lines=100
  set columns=120
  set mousehide
  set guioptions=Ace
  set guifont=Inconsolata:h18,Consolas:h16,Monaco:h16
  set cursorline
endif

" set shell
if has('unix')
  let shell='bash'
endif

" use Cmd-* to move based on display lines
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^


" clear search highlights
nmap c/ :noh<cr>


"split navigation movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" custom commands
command! -nargs=* Wrap set wrap linebreak nolist
