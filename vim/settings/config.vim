" Editor config
set nocompatible
set number
set ruler
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set autoindent
set splitbelow
set showmatch
set errorbells
set visualbell
set hlsearch
set smartcase
set ignorecase
set incsearch
set encoding=utf-8
set fileencoding=utf-8
set updatetime=250
set foldmethod=marker
set foldnestmax=3
set foldlevel=1
set autochdir
set foldignore=
set wildignore=*.swp,*.bak,*.class,*.pyc
set relativenumber
set laststatus=2
" Allow files to be hidden in order to call :e without having to save
set hidden

filetype indent plugin on
syntax on
set shell=/usr/bin/zsh
set tags=./tags,tags;

" Setting 'scrolloff' to a large value causes the cursor 
" to stay in the middle line when possible
" set so=0  " to restore normal behavior
" set so=999
set so=5
