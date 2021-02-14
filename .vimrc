" === Texts ===================================================================
set textwidth=80
set colorcolumn=+1


" === Tabs ====================================================================
set tabstop=4
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent
set smarttab
autocmd BufNewFile,BufRead * set expandtab
autocmd BufNewFile,BufRead * retab


" === Inputs ==================================================================
set backspace=indent,eol,start
set formatoptions+=B
set fileformats=dos


" === Encoding ================================================================
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis,
set fileformats=unix,dos,mac
set ambiwidth=double   " カーソルのズレを補正


" === Commands ================================================================
set wildmenu
set wildmode=list:longest
set belloff=all
set cursorline
set nocursorcolumn


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
set matchpairs& matchpairs+=<:>
set showmatch
set matchtime=3

" FileTypes ===================================================================
autocmd FileType vue syntax sync fromstart
autocmd FileType eruby syntax sync fromstart
autocmd BufNewFile,BufRead *.{html,htm} set filetype=html
autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby
autocmd BufNewFile,BufRead *.{pug*} set filetype=pug
autocmd BufRead,BufNewFile *.scss set filetype=sass
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.rb set filetype=ruby
autocmd BufRead,BufNewFile *.slim set filetype=slim
autocmd BufRead,BufNewFile *.js set filetype=javascript
autocmd BufRead,BufNewFile jquery.*.js set filetype=javascript syntax=jquery
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.pug.javascript.css


" === key map =================================================================
let mapleader = "\<Space>"


"dein Scripts-----------------------------
let s:dein_dir = $HOME . '/.vim/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)


  call dein#load_toml(s:dein_dir . '/darkpower.toml', { 'lazy': 0 })
  call dein#load_toml(s:dein_dir . '/dein.toml', { 'lazy': 0 })
  call dein#load_toml(s:dein_dir . '/lazy.toml', { 'lazy': 1 })

  " call dein#add('vim-scripts/AnsiEsc.vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
