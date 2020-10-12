set nocompatible

" setup Vundle
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Include local .vimrc_local
if filereadable(expand("~/.vimrc_local"))
  source ~/.vimrc_local
endif

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
Bundle 'Lokaltog/vim-easymotion'
Bundle 'lucapette/vim-ruby-doc'
Bundle 'dockyard/vim-easydir'
Bundle "JulesWang/css.vim"
Bundle "henrik/vim-indexed-search"
Bundle "nathanaelkane/vim-indent-guides"
Bundle "pangloss/vim-javascript"
Bundle "briancollins/vim-jst"
Bundle 'slim-template/vim-slim.git'
Bundle 'groenewege/vim-less'
Bundle 'chiedojohn/vim-case-convert'
Bundle 'tpope/vim-fugitive'
Bundle 'janko-m/vim-test'
Bundle 'jwhitley/vim-matchit'
Bundle 'vim-syntastic/syntastic'
Bundle 'joker1007/vim-ruby-heredoc-syntax'
Bundle 'shumphrey/fugitive-gitlab.vim'
Bundle 'tpope/vim-rhubarb'
Bundle 'ngmy/vim-rubocop'
Bundle 'tommcdo/vim-fubitive'

" Elixir
Bundle 'elixir-lang/vim-elixir'
Bundle 'avdgaag/vim-phoenix'

" JS
Bundle 'leafgarland/typescript-vim'
Bundle 'peitalin/vim-jsx-typescript'
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx


" appearance
syntax on

" calorscheme
set t_Co=256
if has('gui_running')
  colorscheme railscasts
else
  colorscheme railscasts-csapprox
endif

" filetypes
filetype plugin indent on

" indents
set expandtab
set tabstop=2
set shiftwidth=2

" key mappings
if has("gui_macvim")
  let macvim_skip_cmd_opt_movement = 1
  let g:ruby_doc_command='open'
endif

nmap <Space> :

" Mac
nmap <D-Right> <C-w>l
nmap <D-Left> <C-w>h
nmap <D-Up> <C-w>k
nmap <D-Down> <C-w>j
" Linux
nmap <M-Right> <C-w><Right>
nmap <M-Left> <C-w><Left>
nmap <M-Up> <C-w><Up>
nmap <M-Down> <C-w><Down>

nmap <C-d> mzyyp`z
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>a
nmap <C-a> :tabonly<CR> :only<CR>

map <D-]> <plug>NERDCommenterToggle
map <M-]> <plug>NERDCommenterToggle

" settings
set clipboard=unnamed
set noswapfile
set nowritebackup
set nobackup
set number
set relativenumber
set guifont=Monospace\ 12

" plugin setup
let g:ctrlp_switch_buffer = ''
let g:ctrlp_custom_ignore = '\v[\/]tmp$'
let g:ctrlp_max_files = 0 

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" - vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#333333 ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#222222 ctermbg=darkgrey

" Press F4 to toggle highlighting on/off, and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>

" Ctags
set tags=tags,./tags

function DeleteBlankLines()
ruby <<EOF
  bc = Vim::Buffer.current
  lines = bc.count
  step = 0
  #lines.downto(1).each do |line|
  (1..lines).each do |line|
    line += step
    if /\S/ !~ bc[line]
      puts "delete #{line} line"
      bc.delete(line)
      step -= 1
    end
  end
  puts 'All blank lines delete'
EOF
endfunction

function DeleteDublicateLines()
ruby << EOF
  bc = Vim::Buffer.current
  (1..bc.count).each do |line|
    next if /\S/ !~ bc[line]
    step = 0
    under_line = line + 1
    (under_line..bc.count).each do |l|
      puts "line #{l} for #{line}"
      l += step
      if bc[line] == bc[l]
        puts "delete #{l}('#{bc[l]}') line, dublicate by '#{bc[line]}'"
        bc.delete(l) 
        step -= 1
      end
      break if under_line > bc.count
    end
  end
EOF
endfunction

command Exec set splitright | vnew | set filetype=sh | read !sh #
