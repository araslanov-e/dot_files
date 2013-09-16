set nocompatible

" setup Vundle
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'scrooloose/nerdtree'


" appearance
syntax on


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
