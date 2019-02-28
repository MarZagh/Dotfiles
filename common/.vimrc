" Mario's vimrc

" basic
let mapleader =" "
set nocompatible
filetype indent plugin on
syntax on
set encoding=utf-8
set number relativenumber
"colo wal

" Autocompletion
set wildmode=longest,list,full

"other stuff
set showcmd
set backspace=indent,eol,start
set ruler
set laststatus=2
set cmdheight=2
set notimeout ttimeout ttimeoutlen=200
set hlsearch
set ignorecase
set autoindent
set expandtab
set smartindent
set shiftwidth=4
set softtabstop=4
set expandtab

" disable bell
set visualbell
set t_vb=

"split navigation (even though i don't use it that much)
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Open split mode normally
set splitbelow splitright

" Copy & Paste to Clipboard
vnoremap <C-Y> "+y
inoremap <C-P> <ESC>"+pa
nnoremap <C-P> "+p

" Bibliography file for LaTeX
map <leader>b :vsp<space>$BIB<CR>


" PLUGINS 
call plug#begin('~/.vim/plugged')
Plug 'dylanaraps/wal.vim'
Plug 'junegunn/goyo.vim'
call plug#end()

map <leader>g :Goyo 66%<CR>


