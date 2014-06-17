" === Tabs ====================================================================
set tabstop=2
set shiftwidth=2
set softtabstop=0

set expandtab
set autoindent
set smartindent
set smarttab


" === Inputs ==================================================================
set backspace=indent,eol,start
set formatoptions+=B


" === Encoding ================================================================
set termencoding=utf-8
set ffs=unix,dos,mac
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp
set ambiwidth=double   " カーソルのズレを補正


" === Commands ================================================================
set wildmenu
set wildmode=list:longest


" === Search ==================================================================
set ignorecase  " 大小文字無視
set smartcase   " 大文字がある時だけ大文字検索
set wrapscan    " 最後→最初
set incsearch   " インクリメンタル
set hlsearch    " ハイライト


" === File ====================================================================
set nobackup
set autoread
set hidden
set history=1000


" === Views ===================================================================
set title
set noruler
set nolist
set wrap
set number

" === Status ==================================================================
set cmdheight=1
set laststatus=2
set statusline=%t\ %{&ff.':'.(&fenc==''?&enc:&fenc)}\ [%04v:%04l/%04L]%0(%m%r%)

" === Bundles =================================================================
set rtp+=~/.vim/vundle/
call vundle#rc()

Bundle 'altercation/vim-colors-solarized'
Bundle 'itchyny/lightline.vim'

Bundle 'mattn/emmet-vim'
Bundle 'html5.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'JulesWang/css.vim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'groenewege/vim-less'

"Bundle 'L9'
"Bundle 'vim-scripts/FuzzyFinder'
Bundle 'scrooloose/nerdtree'
Bundle 'autoclose'

Bundle 'php.vim'
Bundle 'ruby.vim'
Bundle 'rails.vim'
Bundle 'less-syntax'
Bundle 'kchmck/vim-coffee-script'

Bundle 'Shougo/neocomplete'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'

" === FileType ================================================================
syntax on
set background=dark
set complete+=k
colorscheme solarized
let g:solarized_termcolors=256
filetype plugin indent on

" === Cursors =================================================================
set cursorline
hi CursorLine guifg=NONE guibg=#333333 gui=underline
hi Cursorline ctermbg=NONE guibg=#193e51 gui=underline


" === Skeltons ================================================================
augroup SkeltonAu
    autocmd!
    autocmd BufNewFile *.js 0r $HOME/.vim/skeltons/js.skel
    autocmd BufNewFile *.css 0r $HOME/.vim/skeltons/css.skel
    autocmd BufNewFile *.php 0r $HOME/.vim/skeltons/php.skel
augroup END


" === OmniFuncs ==============================================================
augroup OmniFnAu
    autocmd!
    autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
augroup END
