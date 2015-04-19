" Init vim and vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Bundles --------------------- "

Bundle 'gmarik/Vundle.vim'
Bundle "ervandew/supertab"
Bundle 'SirVer/ultisnips'
Bundle 'tpope/vim-fugitive'
Bundle "kien/ctrlp.vim"
Bundle "kchmck/vim-coffee-script"
Bundle "mustache/vim-mustache-handlebars"
Bundle "altercation/vim-colors-solarized"
Bundle "mattn/emmet-vim"
Bundle "Lokaltog/vim-easymotion"

" ----------------------------- "

" Filetype back on
filetype plugin indent on

" Directories
set dir=~/.vim/tmp/
set backupdir=~/.vim/tmp/
let g:ctrlp_cache_dir = $HOME.'/.vim/tmp/ctrlp/'

" UI
syntax enable
set guioptions=
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
set tabstop=4
set shiftwidth=4
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
au BufWritePre * :set binary | set noeol
au BufWritePost * :set nobinary | set eol

" Clear macro
let @q = ''

" Searching
set incsearch
set showmatch
set display+=lastline 
set hlsearch
set ignorecase
set smartcase

" Font
if has("macunix")
    set guifont=Menlo:h14
endif

" Color scheme
if has('gui_running')
    colorscheme solarized
    set background=dark
endif

" Map leader
let mapleader=","

" Use w!! to `sudo` save a file
if has("unix")
    cnoremap w!! w !sudo tee % >/dev/null
endif

" Multi byte files support
if has("multi_byte")
    set termencoding=utf-8
    set fileencodings=utf-8,GB18030,gbk,big5,chinese,ucs-bom
    set fileencoding=utf-8
    set ambiwidth=double
endif

" Fast open current directory
nnoremap <silent><leader>\ :vnew .<CR>

" Window related hotkeys
noremap + <C-w>_<C-w>\|
noremap = <C-w>=
noremap <C-w><Left> :leftabove vnew<cr>
noremap <C-w><Down> :rightbelow new<cr>
noremap <C-w><Up> :leftabove new<cr>
noremap <C-w><Right> :rightbelow vnew<cr>
noremap <C-w><C-w> <C-w><C-p>

" Tab related hotkeys
noremap <C-Tab> gt
noremap <C-S-Tab> gT

" Replace ':' with ';' 
noremap ; :
noremap <leader>; ;

" Fast turn off search highlight
noremap <silent><leader>/ :nohlsearch<CR><C-l>

" Changing page with left and right
noremap <Tab> <C-d>
noremap <S-Tab> <C-u>

" Ctrlp settings
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

" UltiSnips keys
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-s-tab>"
let g:UltiSnipsListSnippets="<c-s-tab>"

" Auto-clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" Remove macvim default arrow navigations
if has("macunix")
    let macvim_skip_cmd_opt_movement = 1
endif

" Natural line navigation
noremap <Down> gj
inoremap <Down> <C-O>gj
noremap <Up> gk
inoremap <Up> <C-O>gk

" Auto-update the diff view
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

" Easy motion key
map <Space> <Plug>(easymotion-bd-w)

" Run macro
noremap <CR> @q