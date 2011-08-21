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
scriptencoding utf8
fixdel

" indentation
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" status line
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\
set laststatus=2

if exists(':filetype')
  filetype plugin indent on
endif

" ui settings
colorscheme darkblue
set cmdheight=2
set ruler
set showmatch
set nowrap
syntax on

if exists('&colorcolumn')
  set colorcolumn=100
endif

if exists('&relativenumber')
  set relativenumber
endif

if has('gui_running')
  set lines=80
  set columns=110
  set mousehide
  set guioptions=ac
  set guifont=Inconsolata:h14,Consolas:h13,Monaco:h13
endif

" set shell
if has('unix')
  let shell='bash'
endif

" Remap the leader key
let mapleader = ","

" edit and source the vimrc file
" (via Derek Wyatt)
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>sv :so $MYVIMRC<CR>

" Faster buffer-switching
nmap <silent> <Leader>h :bp<CR>
nmap <silent> <Leader>l :bn<CR>
nmap <silent> <Leader>, :b#<CR>
nmap <silent> <Leader>q :bd<CR>

" Tabs Tabs Tabs
map <c-t> :tabnew<cr>
map <c-w> :tabclose<cr>
map <c-]> :tabnext<cr>
map <c-[> :tabprevious<cr>

" Saner window management
map <C-h> <C-w>h    " move left
map <C-j> <C-w>j    " move down
map <C-k> <C-w>k    " move up
map <C-l> <C-w>l    " move right
map <C-q> <C-w>q    " close
