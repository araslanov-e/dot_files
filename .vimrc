set nocompatible

" setup Vundle
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle '907th/vim-auto-save'
Bundle 'inkarkat/nerdcommenter'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'kchmck/vim-coffee-script'
Bundle 'godlygeek/csapprox'
Bundle 'Lokaltog/vim-powerline'
Bundle 'msanders/snipmate.vim'

" appearance
syntax on
colorscheme railscasts-csapprox

" filetypes
filetype plugin indent on

" indents
set expandtab
set tabstop=2
set shiftwidth=2

" key mappings
if has("gui_macvim")
  let macvim_skip_cmd_opt_movement = 1
endif

nmap <Space> :

nmap <D-Right> <C-w>l
nmap <D-Left> <C-w>h
nmap <D-Up> <C-w>k
nmap <D-Down> <C-w>j
nmap <C-d> mzyyp`z
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>a

map <D-]> <plug>NERDCommenterToggle

" settings
set clipboard=unnamed
set noswapfile
set nowritebackup
set nobackup
set number
set relativenumber

" plugin setup
let g:ctrlp_switch_buffer = ''
let g:ctrlp_custom_ignore = '\v[\/]tmp$'
let g:ctrlp_max_files = 0 
