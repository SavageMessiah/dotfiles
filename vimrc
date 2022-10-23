set nocompatible
filetype off

"force 256 colors in tmux since things are being dumb
if &term == "screen"
   set t_co=256
   set ttyfast
endif
"colo nord

syntax on
filetype plugin indent on

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set laststatus=2
set encoding=utf-8

set backspace=indent,eol,start
set mouse=a

set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4
set smarttab

set number
set wmh=0
set ruler
set mousehide

set incsearch
set hlsearch

set autoindent
set hidden

set wildmenu
set wildmode=longest,list

nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <silent> h :tabprev<CR>
nmap <silent> j :bn<CR>
nmap <silent> k :bp<CR>
nmap <silent> l :tabnext<CR>

map <silent> <F4> :silent noh<CR>

map!  <c-c>	    <esc>

map <silent> <leader>h :silent noh<CR>

set foldmethod=marker
