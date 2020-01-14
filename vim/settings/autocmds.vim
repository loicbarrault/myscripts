" Closetag
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

" JS Beautify
autocmd FileType javascript noremap <buffer> <c-q> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer> <c-q> :call HtmlBeautify()<cr>
autocmd FileType javascript noremap <buffer> <c-q> :call CSSBeautify()<cr>

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0 | silent! pclose | endif

" Omnicomplete opts for python
set omnifunc=syntaxcomplete#Complete
au FileType python set omnifunc=pythoncomplete#Complete

" Source vimrc after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Set relative numbers when in insert, absolute when not
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" VimCompletesMe
autocmd FileType vim let b:vcm_tab_complete = 'vim'

" teX files
autocmd FileType tex set spell spelllang=en,fr textwidth=77
