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
set noexpandtab
set backspace=indent,eol,start
set clipboard=unnamed
let loaded_matchparen = 1 
colorscheme delek
highlight SpecialKey ctermfg=Black
highlight CursorLine none
highlight CursorLineNr ctermfg=Black ctermbg=Brown
" leader
let mapleader = ","
noremap <leader><TAB> :bnext<CR>
noremap <leader><S-TAB> :bprev<CR>
nnoremap <ESC><ESC> :noh<CR>

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
  let iCanHazVundle=0
endif
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ntpeters/vim-airline-colornum'
Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-signify'
Plugin 'jmcantrell/vim-virtualenv'
"
Plugin 'kana/vim-fakeclip'
Plugin 'Shougo/unite.vim'
Plugin 'ujihisa/unite-colorscheme'
Plugin 'othree/eregex.vim'
Plugin 'tpope/vim-abolish'
if has('lua')
  Plugin 'Shougo/neocomplete.vim'
end
"
Plugin 'groenewege/vim-less'
Plugin 'pangloss/vim-javascript'
Plugin 'rcmdnk/vim-markdown'
Plugin 'digitaltoad/vim-jade'
Plugin 'elzr/vim-json'
call vundle#end()
filetype plugin indent on

if iCanHazVundle == 0
  :BundleInstall
endif
" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" filetype
au BufNewFile,BufRead *.html            set filetype=html
au BufNewFile,BufRead *.less            set filetype=less
au BufNewFile,BufRead *.json            set filetype=json
au BufNewFile,BufRead *.as              set filetype=javascript
au BufNewFile,BufRead *.jade            set filetype=jade
au BufNewFile,BufRead *.md              set filetype=markdown

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark'

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_loc_list_height = 3
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_javascript_eslint_generic = 1
"let g:syntastic_javascript_eslint_exec = 'xo'
"let g:syntastic_javascript_eslint_args = '--compact'
""let g:syntastic_javascript_checkers = ['eslint']

" unite
nnoremap <silent> ;; :<C-u>Unite buffer -direction=botright -auto-resize -toggle<CR>
set list
set listchars=tab:^\ ,trail:~

"
let g:vim_markdown_folding_disabled=1
let g:vim_json_syntax_conceal = 0
nnoremap <leader>/ :call eregex#toggle()<CR> 
set diffopt+=vertical
