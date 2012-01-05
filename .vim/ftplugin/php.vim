" PHP-specific vim commands
" Bill Israel <bill.israel@gmail.com>

" Check syntax
nnoremap <silent> <Leader>vv :!php -l %<CR>

" Align
nnoremap <silent> <Leader>va vi(:Align=><CR>

" PHPDoc
nnoremap <silent> <Leader>vd :call PhpDocSingle()<CR>
vnoremap <c-p> :call PhpDocRange()<CR>

