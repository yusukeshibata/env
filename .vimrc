filetype off
syntax on

"
set termguicolors
set background=dark
set nocompatible
set whichwrap=b,s,[,],,~
set incsearch
set wildmenu wildmode=list:full
set hlsearch
set modeline
set shiftwidth=2
set number
set laststatus=2
set t_Co=256
set runtimepath+=~/.vim/
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
set clipboard=unnamed
set ttimeout
set ttimeoutlen=0
"set listchars=tab:▹␣
set list
set lazyredraw          " Wait to redraw
set scrolljump=8        " Scroll 8 lines at a time at bottom/top
set noshowmatch         " Don't match parentheses/brackets
set nocursorline        " Don't paint cursor line
set nocursorcolumn      " Don't paint cursor column
set exrc
set secure
set autoread
set diffopt+=vertical
set guifont=Menlo-Regular:h14
set mouse=a

"
runtime! userautoload/*.vim
autocmd BufEnter * set mouse=
noremap <leader><TAB> :bnext<CR>
noremap <leader><S-TAB> :bprev<CR>
nnoremap <ESC><ESC> :noh<CR>

"
" Plugin
"

let g:coc_global_extensions = ['coc-tsserver', 'coc-prettier', 'coc-eslint']


if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" styling
Plug 'itchyny/lightline.vim'
" ;; toggle files
Plug 'Shougo/unite.vim'
" Subvert
Plug 'tpope/vim-abolish'
" regex
Plug 'othree/eregex.vim'
" gdiff
Plug 'tpope/vim-fugitive'
" editorconfig
Plug 'editorconfig/editorconfig-vim'
" git diff
Plug 'airblade/vim-gitgutter'
" typescript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" nerdtree
Plug 'scrooloose/nerdtree'
" glsl
Plug 'tikhomirov/vim-glsl'
" rust
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

call plug#end()

"
" Plugin setting
"

" unite
nnoremap <silent> ;; :<C-u>Unite buffer -direction=botright -auto-resize -toggle<CR>
hi LineNr guifg=grey
hi Comment guifg=gray
hi Pmenu guibg=gray
hi NonText guifg=gray10
hi Statement gui=NONE guifg=yellow
hi Todo cterm=bold ctermfg=5 guifg=Blue guibg=Red
" peitalin/vim-jsx-typescript
hi tsxTagName guifg=#E06C75
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575
hi tsxAttrib guifg=#F8BD7F cterm=italic
hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66

" vim-jsx-typescript
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" nerdtree
map <C-a> :NERDTreeToggle %<CR>
nmap <silent> <leader>a <Plug>(coc-diagnostic-next-error)
nmap <silent> <leader>A <Plug>(coc-diagnostic-next)
let NERDTreeQuitOnOpen=1

" glsl
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

""" coc.nvim

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
