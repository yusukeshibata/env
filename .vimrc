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
set cursorline
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

"
runtime! userautoload/*.vim
autocmd BufEnter * set mouse=
noremap <leader><TAB> :bnext<CR>
noremap <leader><S-TAB> :bprev<CR>
nnoremap <ESC><ESC> :noh<CR>

"
" Plugin
"

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" styling
Plug 'altercation/vim-colors-solarized'
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
" autocompletion
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" git diff
Plug 'airblade/vim-gitgutter'
" typescript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" nerdtree
Plug 'scrooloose/nerdtree'

call plug#end()

"
" Plugin setting
"

" unite
nnoremap <silent> ;; :<C-u>Unite buffer -direction=botright -auto-resize -toggle<CR>
" colorscheme
colorscheme solarized
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

""" coc.nvim

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
