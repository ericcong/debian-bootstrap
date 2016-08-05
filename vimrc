" Init vim and vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Bundles --------------------- "

Bundle "gmarik/Vundle.vim"
Bundle "ervandew/supertab"
Bundle "kien/ctrlp.vim"
Bundle "altercation/vim-colors-solarized"

" ----------------------------- "

" Filetype back on
filetype plugin indent on

" Directories
set dir=~/.vim/tmp/
set backupdir=~/.vim/tmp/

" UI
syntax enable
set ruler
set showcmd
set wildmenu
set visualbell
set lazyredraw

" Editing
set wrap linebreak nolist
set encoding=utf-8
set backspace=indent,eol,start
set whichwrap+=<,>,[,],h,l
set history=1024
set iskeyword+=_,$,@,%,#,-
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set smartindent
set tw=0
set autoread
set formatoptions+=n
set magic
set number
set autoread
set ttimeoutlen=0
au BufWritePre * :set binary noeol
au BufWritePost * :set nobinary eol

" Macro
let @q = ''
noremap <CR> @q

" Searching
set incsearch
set showmatch
set display+=lastline 
set hlsearch
set ignorecase
set smartcase

" Map leader
let mapleader=","

" Use w!! to `sudo` save a file
if has("unix")
  cnoremap w!! w !sudo tee % >/dev/null
endif

" Multi byte files support
if has("multi_byte")
  set termencoding=utf-8
  set fileencodings=utf-8
  set fileencoding=utf-8
  set ambiwidth=double
endif

" Fast open current directory
nnoremap <silent> <leader>\ :vnew .<CR>

" Window related hotkeys
noremap + <C-w>_<C-w>\|
noremap = <C-w>=
noremap <silent> <C-w><Left> :leftabove vnew<cr>
noremap <silent> <C-w><Down> :rightbelow new<cr>
noremap <silent> <C-w><Up> :leftabove new<cr>
noremap <silent> <C-w><Right> :rightbelow vnew<cr>
noremap <C-w><C-w> <C-w><C-p>

" Fast turn off search highlight
noremap <silent> <leader>/ :nohlsearch<CR><C-l>

" Natural line navigation
noremap <Down> gj
inoremap <Down> <C-O>gj
noremap <Up> gk
inoremap <Up> <C-O>gk

" Paste and copy
noremap <leader>y "+y
noremap <silent> <leader>p :set paste<CR>"+p:set nopaste<CR>

" Auto update the diff view
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

" Super Tab
let g:SuperTabDefaultCompletionType = 'context'

" Ctrlp
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