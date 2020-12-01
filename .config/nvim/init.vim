call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

let g:airline_theme='base16_gruvbox_dark_hard'
let g:gitgutter_set_sign_backgrounds = 1

augroup restore_cursor_shape
  autocmd!
  au VimLeave * set guicursor=a:ver10-blinkoff0
augroup END

map <leader>t :NERDTreeToggle<CR>
map <leader>f :Files<CR>
" LaTeX Stuff 
au VimLeave *.tex !texclear %
map <leader>c :w! \| !compiler "<c-r>%"<CR><CR>
map <leader>o :w! \| !setsid -f zathura $(echo %:r".pdf") && disown<CR><CR>
map <F3> :w !detex \| wc -w<CR><CR>

" mouse
set mouse=a 

nnoremap j gj
nnoremap k gk

set number
set linebreak
