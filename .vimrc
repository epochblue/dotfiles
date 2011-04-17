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
set tabstop=2
set softtabstop=4
set shiftwidth=2
set expandtab

" status line
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ 
set laststatus=2


" start up pathogen
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()


if exists(':filetype')
  filetype plugin indent on
endif

" ui settings
set cmdheight=2
set ruler
set showmatch
syntax on

" colors
colorscheme darkblue
set bg=dark

if exists('&colorcolumn')
  set colorcolumn=85
endif

if exists('&relativenumber')
  set relativenumber
endif

if has('gui_running')
  set lines=80
  set columns=120
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

" Textmate-like indentation
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" Faster buffer-switching
nmap <silent> <Leader>, :bp<CR>
nmap <silent> <Leader>. :bn<CR>
nmap <silent> <Leader>/ :b#<CR>
nmap <silent> <Leader>q :bd<CR>

" Map Command-T plugin to Ctrl-t
map <C-t> <Leader>t

" Show file in NERDTree
nnoremap <silent> <C-f> :NERDTreeFind<CR> 

" Saner vertical movement
nnoremap j gj
nnoremap k gk

" Saner window management
map <C-h> <C-w>h    " move left
map <C-j> <C-w>j    " move down
map <C-k> <C-w>k    " move up
map <C-l> <C-w>l    " move right
map <C-q> <C-w>q    " close

" Open NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

