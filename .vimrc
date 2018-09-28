" Mario's vimrc

" basic
set nocompatible
filetype indent plugin on
syntax on
set encoding=utf-8
set number
set relativenumber
set wildmenu
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

noremap j gj
noremap k gk

" disable bell
set visualbell
set t_vb=

" compiling for 
"  rmarkdown
autocmd Filetype rmd nnoremap <F5> :!pandoc<space>'<C-r>%'<space>--pdf-engine=pdflatex<space>-o<space><C-r>%.pdf<Enter><Enter>
autocmd Filetype markdown nnoremap <F5> :!pandoc<space>'<C-r>%'<space>--pdf-engine=pdflatex<space>-o<space><C-r>%.pdf<Enter><Enter>
"  latex
autocmd Filetype tex,plaintex nnoremap <F5> :!pdflatex<space>'<C-r>%'<Enter><Enter>
autocmd Filetype tex,plaintex nnoremap <F6> :!biber<space>'%:t:r'<Enter><Enter>
"  python autorun
autocmd Filetype python nnoremap <F5> :!python<space>'<c-r>%'<Enter>

" parantheses and quotation marks helper
autocmd Filetype python,bash,sh inoremap ( ()<Esc>T(i
autocmd Filetype python,bash,sh,rmd,markdown,tex,plaintex inoremap { {}<Esc>T{i
autocmd Filetype python,bash,sh,rmd,markdown,tex,plaintex inoremap [ []<Esc>T[i
autocmd Filetype python,bash,sh inoremap " ""<Esc>i
autocmd Filetype python,bash,sh inoremap ' ''<Esc>i

call plug#begin('~/.vim/plugged')
Plug 'dylanaraps/wal.vim'
Plug 'junegunn/goyo.vim'
call plug#end()

function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set number
  set relativenumber
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  "Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"colorscheme wal

vnoremap <C-Y> "+y
inoremap <C-P> <ESC>"+pa
nnoremap <C-P> "+p

