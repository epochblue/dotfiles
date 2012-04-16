" PHP-specific vim commands
" Bill Israel <bill.israel@gmail.com>

" Check syntax
:setlocal makeprg=php\ -l\ %
:setlocal errorformat=%m\ in\ %f\ on\ line\ %l
nnoremap <silent> <Leader>vv :sil! make<CR>:cwindow<CR>

" Align
nnoremap <silent> <Leader>va vi(:Align=><CR>

" PHPDoc
nnoremap <silent> <Leader>vd :call PhpDocSingle()<CR>
vnoremap <c-p> :call PhpDocRange()<CR>

