" === Texts ===================================================================
set textwidth=80
set colorcolumn=+1


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


" === dein ====================================================================
if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=/Users/nully/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/nully/')
  call dein#begin('/Users/nully/')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/nully/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " Misc
  call dein#add('Shougo/unite.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('vim-scripts/AnsiEsc.vim')
  call dein#add('tpope/vim-endwise')

  " Syntax and Snnipet
  call dein#add('w0rp/ale')
  call dein#add('Shougo/neosnippet-snippets')

  " CSS
  call dein#add('mattn/emmet-vim')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('JulesWang/css.vim')
  call dein#add('cakebaker/scss-syntax.vim')
  call dein#add('groenewege/vim-less')

  " JS
  call dein#add('kchmck/vim-coffee-script')

  " PHP
  call dein#add('stephpy/vim-php-cs-fixer')
  call dein#add('violetyk/neocomplete-php.vim')

  " Rails
  call dein#add('basyura/unite-rails')
  call dein#add('Shougo/neocomplcache.vim')
  call dein#add('tpope/vim-rails')


  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


" Neocomplete =================================================================
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete_php_locale = 'ja'

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=i
endif


" === ALE =====================================================================
let g:ale_statusline_format = ['E%d', 'W%d', '']
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1


" === lightline ===============================================================
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [
      \     ['mode', 'paste'],
      \     ['readonyl', 'filename', 'modified'],
      \     ['ale'],
      \   ]
      \ },
      \ 'component_function': {
      \   'ale': 'ALEGetStatusLine'
      \ }
      \ }


" === php-cs-fixer =============================================================
" If php-cs-fixer is in $PATH, you don't need to define line below
" let g:php_cs_fixer_path = "~/php-cs-fixer.phar" " define the path to the php-cs-fixer.phar

" If you use php-cs-fixer version 2.x
let g:php_cs_fixer_rules = "@PSR2"          " options: --rules (default:@PSR2)
let g:php_cs_fixer_cache = ".php_cs.cache" " options: --cache-file
"let g:php_cs_fixer_config_file = '.php_cs' " options: --config
" End of php-cs-fixer version 2 config params

let g:php_cs_fixer_php_path = "php"               " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.

