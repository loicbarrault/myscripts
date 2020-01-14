" Vundle setup
set nocompatible " be iMproved, required
filetype off     " Require
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""""" Bundles
" Let vundle handle vundle
Bundle 'gmarik/vundle.vim'

" Syntax highlighting for Python
Bundle 'hdima/python-syntax'

" Align chars
Bundle 'godlygeek/tabular'

" Autocomment
Bundle 'tomtom/tcomment_vim'

""" Programming languages
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'Yggdroot/indentLine'

"" Syntax
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Bundle 'ajh17/VimCompletesMe'
" Bundle 'marijnh/tern_for_vim'
Bundle 'elzr/vim-json'
Bundle 'nvie/vim-flake8'

"" CSS
"Bundle "JulesWang/css.vim"
"Bundle "genoma/vim-less"
"Bundle 'othree/html5.vim.git'
"Bundle 'hail2u/vim-css3-syntax.git'

""" Random Tools

"" Delimiting (closing of tags)
Bundle 'Raimondi/delimitMate.git'
Bundle 'docunext/closetag.vim.git'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'

"" Fugitive & vim-git - Git in Vim
Bundle 'tpope/vim-fugitive.git'
Bundle 'tpope/vim-rhubarb'
Bundle 'tpope/vim-git.git'
Bundle 'scrooloose/nerdtree.git'

" For scratch buffer
Bundle 'kana/vim-scratch'

"" Multiple selection
Bundle 'terryma/vim-multiple-cursors'

"" Airline
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'

" Rename Tabs
Bundle 'gcmt/taboo.vim'

"" Show diffs
Bundle 'airblade/vim-gitgutter'

"" Different theme
Bundle 'arcticicestudio/nord-vim'
"Bundle 'rakr/vim-one'

"" Support for writing LaTeX documents
Bundle 'lervag/vimtex'

"" Tagbar
Bundle 'majutsushi/tagbar'

"" to better read code, showing different levels of parentheses in different
" Bundle 'luochen1990/rainbow'

"" Templates
Bundle 'fredblain/vim-template'
Bundle 'plasticboy/vim-markdown'

call vundle#end()
