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

set runtimepath+=$HOME/.vim/bundle/vundle/
runtime autoload/vundle.vim

if exists( '*vundle#rc' )

  filetype off
  call vundle#rc()

  Plugin 'gmarik/vundle'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  "Plugin 'airblade/vim-gitgutter'
  "Plugin 'mhinz/vim-signify'
  "Plugin 'jmcantrell/vim-virtualenv'
  Plugin 'Shougo/unite.vim'
  Plugin 'ujihisa/unite-colorscheme'
  Plugin 'tpope/vim-abolish'
  Plugin 'groenewege/vim-less'
  Plugin 'pangloss/vim-javascript'
  Plugin 'mxw/vim-jsx'
  "Plugin 'godlygeek/tabular'
  Plugin 'plasticboy/vim-markdown'
  Plugin 'digitaltoad/vim-pug'
  Plugin 'elzr/vim-json'
  Plugin 'flazz/vim-colorschemes'
  Plugin 'othree/eregex.vim'
  Plugin 'editorconfig/editorconfig-vim'
  Plugin 'shougo/neocomplcache.vim'
  "Plugin 'ahw/vim-hooks.git'
  Plugin 'tpope/vim-fugitive'

endif

command  InstallVundle
\ if ! InstallVundle()                                                            |
\   echohl ErrorMsg                                                               |
\   echomsg 'Failed to install Vundle automatically. Please install it yourself.' |
\   echohl None                                                                   |
\ endif
function InstallVundle()
  let vundle_repo = 'https://github.com/gmarik/vundle.git'
  let path = substitute( $HOME . '/.vim/bundle/vundle', '/', has( 'win32' ) ? '\\' : '/', 'g' )
  if ! executable( 'git' )
    echohl ErrorMsg | echomsg 'Git is not available.' | echohl None | return 0
  endif
  if isdirectory( path )
    return 1
  endif
  if ! isdirectory( path )
    silent! if ! mkdir( path, 'p' )
      echohl ErrorMsg | echomsg 'Cannot create directory (may be a regular file): ' . path | echohl None | return 0
    endif
  endif
  echo 'Cloning vundle...'
  if system( 'git clone "' . vundle_repo . '" "' . path . '"'  ) =~ 'fatal'
    echohl ErrorMsg | echomsg 'Cannot clone ' . vundle_repo . ' (' . path . ' may be not empty)' | echohl None | return 0
  endif
  echo 'Vundle installed. Please restart vim and run :PluginInstall'
  PluginInstall
  return 1
endfunction
InstallVundle

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

colorscheme deepsea
