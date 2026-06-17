call plug#begin()

" List your plugins here
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'vim-airline/vim-airline'

call plug#end()

set number
set shiftwidth=4
set tabstop=4
set autoindent
set mouse=a

set nobackup
set noswapfile
set noundofile

syntax on

set termguicolors

colorscheme catppuccin_mocha
hi Normal guibg=NONE " Sets background to transparent so I can see my yuri <3

let g:airline_theme = 'catppuccin_mocha'

" Force separators because the defaults are none for some reason
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

set clipboard=unnamed
