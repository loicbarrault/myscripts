" Vundle setup
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}




""""" Bundles

" Syntax highlighting for Python
Plugin 'hdima/python-syntax'

" Align chars
" Bundle 'godlygeek/tabular'

" Autocomment
" Bundle 'tomtom/tcomment_vim'

""" Programming languages
" Bundle 'MarcWeber/vim-addon-mw-utils'
" Bundle 'tomtom/tlib_vim'
" Bundle 'SirVer/ultisnips'
" Bundle 'honza/vim-snippets'
" Bundle 'Yggdroot/indentLine'

"" Syntax
" Bundle 'jelera/vim-javascript-syntax'
" Bundle 'pangloss/vim-javascript'
" " Bundle 'ajh17/VimCompletesMe'
" " Bundle 'marijnh/tern_for_vim'
" Bundle 'elzr/vim-json'

"" CSS
"Bundle "JulesWang/css.vim"
"Bundle "genoma/vim-less"
"Bundle 'othree/html5.vim.git'
"Bundle 'hail2u/vim-css3-syntax.git'

""" Random Tools

"" Delimiting (closing of tags)
" Bundle 'Raimondi/delimitMate.git'
" Bundle 'docunext/closetag.vim.git'
" Bundle 'tpope/vim-endwise'
" Bundle 'tpope/vim-surround'

"" Fugitive & vim-git - Git in Vim
" Bundle 'tpope/vim-fugitive.git'
" Bundle 'tpope/vim-rhubarb'
" Bundle 'tpope/vim-git.git'
" Bundle 'scrooloose/nerdtree.git'

" For scratch buffer
" Bundle 'kana/vim-scratch'

"" Multiple selection
" Bundle 'terryma/vim-multiple-cursors'

"" Airline
" Bundle 'vim-airline/vim-airline'
" Bundle 'vim-airline/vim-airline-themes'

" Rename Tabs
" Bundle 'gcmt/taboo.vim'

"" Show diffs
" Bundle 'airblade/vim-gitgutter'

"" Different theme
" Bundle 'arcticicestudio/nord-vim'
"Bundle 'rakr/vim-one'

"" Support for writing LaTeX documents
" Bundle 'lervag/vimtex'

"" Tagbar
" Bundle 'majutsushi/tagbar'

"" to better read code, showing different levels of parentheses in different
" Bundle 'luochen1990/rainbow'

"" Templates
" Bundle 'fredblain/vim-template'
" Bundle 'plasticboy/vim-markdown'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

call vundle#end()
