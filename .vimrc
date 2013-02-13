" .vimrc
" Bill Israel [http://cubicle17.com/]

" Pathogen
silent! call pathogen#infect()

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

" status line
set stl=%f\ %m\ %r\ line\ %l\ of\ %L\ [%p%%],\ column\ %c%=Type:%y
set laststatus=2

" baseline ui settings
" default non-gui colorscheme = desert, but prefer solarized
colorscheme desert
set background=dark
set cmdheight=2
set ruler
set showmatch
set nowrap
syntax on

" relative line numbering
if exists('&relativenumber')
  set relativenumber
endif

" gui settings
if has('gui_running')
  hi CursorLine guibg=#606060
  " default colorscheme = darkblue, but prefer solarized
  colorscheme darkblue
  silent! colorscheme solarized
  set lines=100
  set columns=120
  set mousehide
  set guioptions=Ace
  set guifont=Inconsolata:h14,Consolas:h13,Monaco:h13
  set cursorline
endif

" set shell
if has('unix')
  let shell='bash'
endif

" Remap the leader key
let mapleader = ","

" Don't lose the 'reverse search direction' command
nnoremap <Leader>, ,

" edit and source the vimrc file
" (via Derek Wyatt)
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>sv :so $MYVIMRC<CR>

" Quick toggling between light and dark backgrounds
call togglebg#map("<Leader>b")

" Faster tab-switching
nmap <silent> <Leader>t :tabnew<CR>
nmap <silent> <Leader>q :tabc<CR>
nmap <silent> <Leader>< :tabp<CR>
nmap <silent> <Leader>> :tabn<CR>

" Saner split-view management
map <c-h> <c-w>h    " move left
map <c-j> <c-w>j    " move down
map <c-k> <c-w>k    " move up
map <c-l> <c-w>l    " move right

" NERDTree
let NERDTreeWinSize=40
let NERDTreeIgnore=['cache', '\.swp$']
let NERDTreeMinimalUI=1
nnoremap <silent> <c-n> :NERDTreeToggle<CR>

" Return clears the last search
nnoremap <silent> <CR> :noh<CR>

" Toggle between relative and non-relative line numbers
function! g:ToggleNumberMode()
    if (&relativenumber)
        set number
    else
        set relativenumber
    endif
endfunc

nnoremap <silent> <Leader>ln :call g:ToggleNumberMode()<CR>

" Turn off line numbers
function! g:ToggleNumbers()
    if (&relativenumber)
        set relativenumber!
    else
        set number!
    endif
endfunc

nnoremap <silent> <Leader>ll :call g:ToggleNumbers()<CR>

" CtrlP (a fuzzy finder)
let g:ctrlp_map='<Leader>f'
let g:ctrlp_working_path_mode=2
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" Move by row, not by line (with reverse mappings)
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

