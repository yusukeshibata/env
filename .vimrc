filetype off
if &compatible
	set nocompatible
endif

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
set ttimeout
set ttimeoutlen=0
let loaded_matchparen = 1
colorscheme delek
highlight SpecialKey ctermfg=Black
highlight CursorLine none
highlight CursorLineNr ctermfg=Black ctermbg=Brown

" if has('nvim')
"		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" endif

" leader
let mapleader = ","
noremap <leader><TAB> :bnext<CR>
noremap <leader><S-TAB> :bprev<CR>
nnoremap <ESC><ESC> :noh<CR>

" dein
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
	execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir
call dein#begin(s:dein_dir)
call dein#add('Shougo/dein.vim')
call dein#add('scrooloose/syntastic')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('ntpeters/vim-airline-colornum')
call dein#add('airblade/vim-gitgutter')
call dein#add('mhinz/vim-signify')
call dein#add('jmcantrell/vim-virtualenv')
call dein#add('kana/vim-fakeclip')
call dein#add('Shougo/unite.vim')
call dein#add('ujihisa/unite-colorscheme')
call dein#add('othree/eregex.vim')
call dein#add('tpope/vim-abolish')
call dein#add('groenewege/vim-less')
call dein#add('pangloss/vim-javascript')
call dein#add('rcmdnk/vim-markdown')
call dein#add('digitaltoad/vim-pug')
call dein#add('elzr/vim-json')
call dein#add('Shougo/deoplete.nvim')
call dein#end()

if dein#check_install()
	call dein#install()
endif

filetype plugin indent on

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark'

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_loc_list_height = 3
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_javascript_eslint_generic = 1
" let g:syntastic_javascript_eslint_exec = 'xo'
" let g:syntastic_javascript_eslint_args = '--compact'
" let g:syntastic_javascript_checkers = ['eslint']

" unite
nnoremap <silent> ;; :<C-u>Unite buffer -direction=botright -auto-resize -toggle<CR>
set list
set listchars=tab:^\ ,trail:~

"
let g:vim_markdown_folding_disabled=1
let g:vim_json_syntax_conceal = 0
nnoremap <leader>/ :call eregex#toggle()<CR>
set diffopt+=vertical

"
let g:deoplete#enable_at_startup = 1
