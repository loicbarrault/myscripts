" Editor config
set nocompatible
" show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" " On pressing tab, insert 4 spaces
set expandtab

set scrolloff=3

set antialias

set encoding=utf-8
" set fileencoding=utf-8

syntax enable
set number
set ruler
set wrap

set incsearch
set hlsearch

set background=dark
set backspace=indent,eol,start

" set softtabstop=2
set autoindent
set splitbelow
set showmatch
" set errorbells
set visualbell
set updatetime=250

set ignorecase
set smartcase
" Allow files to be hidden in order to call :e without having to save
set hidden

" set smarttab

" Enable folding
set foldmethod=indent
set foldlevel=99
" set foldmethod=marker
set foldnestmax=3
" set foldlevel=1
" set foldignore=
" Enable folding with the spacebar
nnoremap <space> za
" see the docstrings for folded code:
let g:SimpylFold_docstring_preview=1

set autochdir
set wildignore=*.swp,*.bak,*.class,*.pyc
" set relativenumber
set laststatus=2

filetype indent plugin on
syntax on
" set shell=/usr/bin/zsh
set tags=./tags,tags;

" Setting 'scrolloff' to a large value causes the cursor
" to stay in the middle line when possible
" set so=0  " to restore normal behavior
" set so=999
set so=5
