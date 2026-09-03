let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" List your plugins here
Plug 'RAVEN-031/catppuccin-vim', { 'as': 'catppuccin', 'branch': 'main' }
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Sets autocomplete to Control + Space for Coc.vim
inoremap <silent><expr> <C-@> coc#pum#visible() ? coc#pum#confirm() : "\<C-@>"

set number
set wrap
set linebreak
set shiftwidth=4
set tabstop=4
set autoindent
set mouse=a

set nobackup
set noswapfile
set noundofile

set termguicolors

colorscheme catppuccin_mocha
let g:airline_theme = 'catppuccin_mocha'

" Force separators because the defaults are none for some reason
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

set clipboard=unnamedplus

hi Normal guifg=grey guibg=black
