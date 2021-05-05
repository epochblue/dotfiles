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
filetype plugin indent on
scriptencoding utf8
fixdel


" searching
set nohlsearch
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
syntax enable
set background=light
let g:solarized_termcolors=256
colorscheme solarized
set guicursor=
set cmdheight=2
set ruler
set showmatch
set number
set relativenumber
set colorcolumn=80,100
set signcolumn=yes
highlight! link SignColumn LineNr


" gui settings
if has('gui_running')
  set mousehide
  set guioptions=Ace
  set guifont=Menlo:h18
endif


" set shell
if has('unix')
  let shell='bash'
endif


" plugins
call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'altercation/vim-colors-solarized'
call plug#end()


" plugin configs
set updatetime=100
let g:gitgutter_set_sign_backgrounds=1

let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }



" plugin commands
nnoremap <C-p> :GFiles<cr>


" leader and remaps
let mapleader = " "
nnoremap <leader>t :sh<cr>


" custom commands
command! -nargs=* Wrap set wrap linebreak nolist


" auto commands
augroup ON_WRITE
    autocmd!
    autocmd BufWritePost * GitGutter
    autocmd BufWritePre * %s/\s\+$//e
augroup END

