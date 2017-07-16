set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Plugins ====
Plugin 'ervandew/supertab'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'luochen1990/rainbow'
Plugin 'plasticboy/vim-markdown'
Plugin 'easymotion/vim-easymotion'
" ============

call vundle#end()
filetype plugin indent on

set dir=~/.vim/tmp/
set backupdir=~/.vim/tmp/
set history=10000
set magic
set ttimeoutlen=0
set encoding=utf-8
if has("multi_byte")
  set termencoding=utf-8
  set fileencodings=utf-8
  set fileencoding=utf-8
  set ambiwidth=double
endif
au BufWritePre * :set binary noeol
au BufWritePost * :set nobinary eol

syntax enable
set t_Co=256
set ruler
set showcmd
set wildmenu
set visualbell
set lazyredraw
set number
set background=dark
colo solarized

set wrap
set linebreak
set nolist
set backspace=indent,eol,start
set whichwrap+=<,>,[,],h,l
set iskeyword+=_,$,@,%,#,-
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
set smartindent
set textwidth=0
set autoread
set formatoptions+=nj
set copyindent

set incsearch
set showmatch
set display+=lastline
set hlsearch
set ignorecase
set smartcase

let @q=''
noremap <CR> @q
let mapleader=","
cnoremap w!! w !sudo tee % >/dev/null
noremap <silent> <leader>/ :nohlsearch<CR><C-l>
noremap + <C-w>_<C-w>\|
noremap = <C-w>=
noremap <silent> <C-w><Left> :leftabove vnew<CR>
noremap <silent> <C-w><Down> :rightbelow new<CR>
noremap <silent> <C-w><Up> :leftabove new<CR>
noremap <silent> <C-w><Right> :rightbelow vnew<CR>
noremap <C-w><C-w> <C-w><C-p>
cnoreabbrev cs Csearch
nnoremap <silent> <leader>\ :vnew .<CR>
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

let g:rainbow_active = 1

let g:SuperTabDefaultCompletionType = 'context'

let g:ctrlp_cache_dir = $HOME.'/.vim/tmp/ctrlp/'
noremap <silent> <leader>r :CtrlPClearCache<CR>
let g:ctrlp_map = '\'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_buffer_func = {'enter': 'Ctrlp_enter', 'exit':  'Ctrlp_exit'}
func! Ctrlp_enter()
    set laststatus=0
endfunc
func! Ctrlp_exit()
    set laststatus=1
endfunc

let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_folding_disabled = 1

map <Space> <Plug>(easymotion-bd-w)