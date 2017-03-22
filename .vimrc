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

filetype off
let s:path = substitute($HOME . '/.vim/bundle/vundle', '/', has('win32' ) ? '\\' : '/', 'g')
execute 'set runtimepath+=' . s:path

runtime autoload/vundle.vim

let g:plugininit = 0
if ! exists('*vundle#rc')
  echo 'Installing plugins...'
  silent! execute '! git clone https://github.com/gmarik/vundle.git' s:path
  let g:plugininit = 1
endif

"if exists('*vundle#rc')
  call vundle#rc()
  Plugin 'gmarik/vundle'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'mhinz/vim-signify'
  Plugin 'Elive/vim-colorscheme-elive'
  Plugin 'Shougo/unite.vim'
  Plugin 'ujihisa/unite-colorscheme'
  Plugin 'tpope/vim-abolish'
  Plugin 'groenewege/vim-less'
  Plugin 'pangloss/vim-javascript'
  Plugin 'mxw/vim-jsx'
  Plugin 'plasticboy/vim-markdown'
  Plugin 'digitaltoad/vim-pug'
  Plugin 'elzr/vim-json'
  Plugin 'flazz/vim-colorschemes'
  Plugin 'othree/eregex.vim'
  Plugin 'editorconfig/editorconfig-vim'
  Plugin 'shougo/neocomplcache.vim'
  Plugin 'tpope/vim-fugitive'
  if g:plugininit
    silent! PluginInstall
  endif
"endif

filetype plugin indent on

"""

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark'

" unite
nnoremap <silent> ;; :<C-u>Unite buffer -direction=botright -auto-resize -toggle<CR>

" hidden chars
" set list
" set listchars=tab:^\ ,trail:~

"
nnoremap <leader>/ :call eregex#toggle()<CR>
set diffopt+=vertical

let g:neocomplcache_enable_at_startup = 1
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

let g:jsx_ext_required = 0
let g:vimhooks_async = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['javascript=js']

silent! colorscheme elive
