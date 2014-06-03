" Init vim and vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()


" Bundles --------------------- "

Bundle 'gmarik/Vundle.vim'
Bundle "kchmck/vim-coffee-script"
Bundle "ervandew/supertab"
Bundle "nathanaelkane/vim-indent-guides"
Bundle 'SirVer/ultisnips'
Bundle 'ericcong/vim-snippets'
Bundle 'tpope/vim-fugitive'
Bundle "kien/ctrlp.vim"
Bundle "mustache/vim-mustache-handlebars"
Bundle "altercation/vim-colors-solarized"
Bundle "mattn/emmet-vim"

" ----------------------------- "


" Filetype back on
filetype plugin indent on


" Turn on syntax
syntax enable


" Directories
set dir=~/.vim/tmp/
set backupdir=~/.vim/tmp/
let g:ctrlp_cache_dir = $HOME.'/.vim/tmp/ctrlp/'


" UI
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

" Searching
set incsearch
set showmatch
set display+=lastline 
set hlsearch
set ignorecase   


" Wild ignores
set wildignore+=.git,*/tmp/*,*.so,*.o,*.obj,*/*cache/*,*.class,*.db
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.ico,*.nef
set wildignore+=*.DS_Store*,Library,Music,Movies,Pictures,Applications,Downloads,*/.Trash/*
set wildignore+=*.jar,*.zip,*.dmg,*.app,*.iso
set wildignore+=*.pdf,*.doc,*.pages,*.xls,*.numbers,*.ppt,*.keynote,*.mobi,*.epub


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


" Auto-update the diff view
autocmd BufWritePost * if &diff == 1 | diffupdate | endif


" Use w!! to `sudo` save a file
if has("unix")
    cnoremap w!! w !sudo tee % >/dev/null
endif


" Plain text files will auto wrap lines, set text-width to 80
autocmd FileType tex call TextOptions()
autocmd FileType markdown call TextOptions()
function TextOptions()
    set tw=80
    set formatoptions+=aw
endfunction


" Multi byte files support
if has("multi_byte")
    set termencoding=utf-8
    set fileencodings=utf-8,GB18030,gbk,big5,chinese,ucs-bom
    set fileencoding=utf-8
    set ambiwidth=double
endif


" Mouse support
if has('mouse')
    set mouse=a
endif

noremap <silent><leader>n :set number! number?<cr>

" Fast open file navigator
let g:ctrlp_map = '\'


" Fast open current directory
nnoremap <silent><leader>\ :vnew .<CR>



" Window related hotkeys
nnoremap <silent>+ <C-w>_<C-w>\|
nnoremap <silent>= <C-w>=
nnoremap <silent><C-w><Up> :leftabove new<cr>
nnoremap <silent><C-w><Down> :rightbelow new<cr>
nnoremap <silent><C-w><Left> :leftabove vnew<cr>
nnoremap <silent><C-w><Right> :rightbelow vnew<cr>


" Tab related hotkeys
noremap <silent><C-Tab> gt
noremap <silent><C-S-Tab> gT


" Replace ':' with ';' 
noremap ; :
noremap <leader>; ;


" Fast turn off search highlight
nnoremap <silent><leader>/ :nohlsearch<CR>


" Tab can be used to find the other part of parenthesis
noremap <Tab> %


" '<leader>=' will also format paragraphs
vnoremap <leader>= =gvgq


" Ctrlp settings
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_buffer_func = {'enter': 'Function_Name_1', 'exit':  'Function_Name_2'}
func! Function_Name_1()
    set laststatus=0
endfunc
func! Function_Name_2()
    set laststatus=1
endfunc


" UltiSnips keys
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-s-tab>"
let g:UltiSnipsListSnippets="<c-s-tab>"


" IndentGuides
let g:indent_guides_guide_size = 1


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


" Option-arrow moves between words
noremap <A-Left> b
inoremap <A-Left> <C-O>b
cnoremap <A-Left> <S-Left>
noremap <A-Right> e
inoremap <A-Right> <C-O>e<Right>
cnoremap <A-Right> <S-Right>
inoremap <A-Backspace> <C-W>
cnoremap <A-Backspace> <C-W>


" Command-arrow moves to the beginning or end of the line
noremap <D-Left> g^
inoremap <D-Left> <C-O>g^
cnoremap <D-Left> <C-B>
noremap <D-Right> g$
inoremap <D-Right> <C-O>g$
cnoremap <D-Left> <C-E>
inoremap <D-Backspace> <C-U>
cnoremap <D-Backspace> <C-U>


" Shift-arrow selects text in insert mode
" Can be used along with option-arrow and command-arrow
inoremap <S-Left> <C-O>vh
vnoremap <S-Left> h
inoremap <S-A-Left> <C-O>vb
inoremap <S-D-Left> <C-O>vg^
inoremap <S-Right> <C-O>vl
vnoremap <S-Right> l
inoremap <S-A-Right> <C-O>ve
inoremap <S-D-Right> <C-O>vg$
