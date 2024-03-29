if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'dhruvasagar/vim-table-mode'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['json', 'java', 'vim', 'c', 'cpp']}
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
call plug#end()

let g:NERDTreeWinSize=25
let NERDTreeMinimalUI=1

let g:table_mode_corner='|'

au BufRead,BufNewFile *.todo set filetype=todo

" map caps to esc
"au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

autocmd vimenter * ++nested colorscheme gruvbox-material
" let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline#extensions#tabline#enabled = 1

filetype plugin indent on

set ignorecase
set smartcase

set title

syntax on

au BufRead,BufNewFile *.md setlocal spell! spelllang=en_us | syntax sync fromstart

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set noexpandtab

augroup restore_cursor_shape
	autocmd!
	au VimLeave * set guicursor=a:ver10-blinkoff0
augroup END

map <leader>t :NERDTreeToggle<CR>
map <leader>f :Files<CR>
map <leader>s :setlocal spell! spelllang=en_us \| :syntax sync fromstart<CR>
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

" LaTeX Stuff
au VimLeave *.tex !texclear %
map <leader>c :w! \| !compiler "<c-r>%"<CR><CR>
map <leader>o :w! \| !setsid -f zathura $(echo %:r".pdf") && disown<CR><CR>
map <F3> :w !detex \| wc -w<CR>

" remove whitespaces
map <F5> :%s/\s\+$//e \| noh<CR>

" mouse
set mouse=a

set termguicolors

nnoremap j gj
nnoremap k gk

set number

"augroup numbertoggle
"	autocmd!
"	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END

set linebreak
set clipboard=unnamedplus

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

source ~/.config/nvim/comments.vim
map <C-a> :call Comment()<CR>
map <C-b> :call Uncomment()<CR>
map \--# :call UncommentBlock()<CR>


" coc
if has("nvim-0.5.0") || has("patch-8.1.1564")
	set signcolumn=number
else
	set signcolumn=yes
endif


inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

au FileType vim,java,c,cpp inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

au VimLeave *.java !rm *.class
