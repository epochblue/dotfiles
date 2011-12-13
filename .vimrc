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
set backspace=indent,eol,start

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

" status line
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\
set laststatus=2

if exists(':filetype')
  filetype plugin indent on
endif

" ui settings
set cmdheight=2
set ruler
set showmatch
set nowrap
syntax on

if exists('&relativenumber')
  set relativenumber
endif

if has('gui_running')
  colorscheme darkblue
  set background=dark
  set lines=100
  set columns=200
  set mousehide
  set guioptions=aAce
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
nmap <silent> <Leader>, :bp<CR>
nmap <silent> <Leader>. :bn<CR>
nmap <silent> <Leader>/ :b#<CR>
nmap <silent> <Leader>q <c-w>q 

" Saner window management
map <c-h> <c-w>h    " move left
map <c-j> <c-w>j    " move down
map <c-k> <c-w>k    " move up
map <c-l> <c-w>l    " move right

" NERDTree
let NERDTreeWinSize=40
let NERDTreeIgnore=['cache', '\.swp$']
let NERDTreeMinimalUI=1
map <c-n> :NERDTreeToggle<CR>
map <c-m> :NERDTreeFind<CR>

" CtrlP (a fuzzy finder)
let g:ctrlp_map='<Leader>f'
let g:ctrlp_working_path_mode=2
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" Pathogen
call pathogen#infect()

" Open NERDTree by default, if we have NERDTree
if exists(':NERDTree') 
    NERDTreeToggle
endif

