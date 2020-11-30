augroup restore_cursor_shape
  autocmd!
  au VimLeave * set guicursor=a:ver10-blinkoff0
augroup END

au VimLeave *.tex !texclear %
map <leader>c :w! \| !compiler "<c-r>%"<CR>
map <leader>o :w! \| !setsid -f zathura $(echo %:r".pdf") && disown<CR><CR>

set number
set linebreak
