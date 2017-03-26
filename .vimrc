filetype off
set nocompatible

set backspace=start,eol,indent
set whichwrap=b,s,[,],,~
set incsearch
set wildmenu wildmode=list:full
syntax on
set hlsearch
set cursorline
set modeline
set shiftwidth=2
set number
set laststatus=2
set t_Co=256
set runtimepath+=~/.vim/
runtime! userautoload/*.vim

set scrolloff=5
set noswapfile
set nowritebackup
set nobackup
set hidden
set switchbuf=useopen
set ignorecase
set smartcase
set history=10000
set showmatch
set smartindent
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backspace=indent,eol,start
"set clipboard=unnamed
set ttimeout
set ttimeoutlen=0
autocmd BufEnter * set mouse=
let loaded_matchparen = 1
let mapleader = ","
noremap <leader><TAB> :bnext<CR>
noremap <leader><S-TAB> :bprev<CR>
nnoremap <ESC><ESC> :noh<CR>

"""

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-signify'
Plug 'Elive/vim-colorscheme-elive'
Plug 'Shougo/unite.vim'
Plug 'tpope/vim-abolish'
Plug 'groenewege/vim-less'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'othree/eregex.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
call plug#end()

" unite
nnoremap <silent> ;; :<C-u>Unite buffer -direction=botright -auto-resize -toggle<CR>

"
set diffopt+=vertical

let g:jsx_ext_required = 0
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

silent! colorscheme elive
