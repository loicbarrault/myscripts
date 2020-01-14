let g:python_host_prog = '/bin/python'

" YCM 
" let g:ycm_path_to_python_interpreter='/usr/loca/opt/python' " Prevents YCM from failing
let g:ycm_use_ultisnips_completet=1
let g:ycm_add_preview_to_completeopt=1
let g:ycm_confirm_extra_conf=1
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_filepath_completion_use_working_dir=1
let g:ycm_show_diagnostics_ui=1
let g:ycm_enable_diagnostic_signs=1
let g:ycm_enable_diagnostic_highlighting=1
let g:ycm_echo_current_diagnostic=1

" Tern for vim
let g:tern_show_argument_hints_enabled='on_move'
set completeopt=menuone,longest

" Disable python-mode syntax checking
let g:pymode_lint = 1
let g:pymode_rope_complete_on_dot = 0

" Latex syntax highlighting
let g:tex_flavor='latex'
let g:indentline_fileTypeExclude = ['tex','bib','latex']

" indentLine config
let g:indentLine_color_term=107
let g:indentLine_char = '│'
let g:indentLine_fileTypeExclude = ['tex', 'bib', 'latex']

" Python set highlighting
let python_version_2=1
" let python_highlight_builtins=1
" let python_highlight_exceptions=1
" let python_highlight_string_formatting=1
" let python_highlight_string_format=1
" let python_highlight_string_templates=1
" let python_highlight_indent_errors=1
" let python_highlight_space_errors=1
" let python_highlight_doctests=1
" let python_print_as_function=1
" let python_highlight_file_headers_as_comments=1
let python_highlight_all=1

" JSON syntax highlighting
" JSON linting options
let g:vim_json_syntax_conceal = 1
let g:vim_json_syntax_conceal=0

" Fugitive
" set laststatus=2                          " Enables the status line at the bottom of vim
" set statusline=%10{fugitive#statusline()}
" set statusline+=%40f                      " Shows filename
" set statusline+=%=                        " Right aligns the remainder of the status bar
" set statusline+=%20y
"set statusline+=%10((%l,%c)%)             " Show line and column

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 2
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#taboo#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline_theme='simple'
" let g:nord_comment_brightness = 12
let g:nord_italic_comments = 1
set laststatus=2
set noshowmode
" set guifont=Droid\ Sans\ Mono\ Dotted\ for\ Powerline
set guifont=Inconsolata\ for\ Powerline

" Gitgutter
let g:gitgutter_highlight_lines = 0
"let g:gitgutter_sign_column_always = 1
set signcolumn=yes

" Taboo
let g:taboo_tabline = 0

" Tagbar
let g:tagbar_ctags_bin = "ctags"
let g:tagbar_singleclick = 1
let g:tagbar_width = 45 "24 is a minimum otherwise it does not work
"let g:tagbar_left = 1
if !&diff
  autocmd VimEnter * nested :call tagbar#autoopen(1)
  autocmd FileType * nested :call tagbar#autoopen(0)
endif

" NerdTree
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"Close if NERDTREE last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeIgnore = ['\~$','\.pyc$','\.*.swp$','\.git$','\.ropeproject$','.venv*','__pycache__']
" close NERDTree after a file is opened
"let g:NERDTreeQuitOnOpen=1
" " show hidden files in NERDTree
let NERDTreeShowHidden=1
let NERDTreeWinSize=25
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.config/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

" GPG
" let g:GPGPossibleRecipients=["Fred Blain <fc.blain@gmx.com>"]
" let g:GPGUsePipes=1

" Vimtex
" let g:vimtex_compiler_latexmk = {
"       \ 'backend' : 'nvim',
"       \ 'background' : 1,
"       \ 'callback' : 1,
"       \ 'continuous' : 1,
"       \ 'executable' : '/usr/bin/latexmk',
"       \ 'options' : [
"       \  '-verbose',
"       \  '-file-line-error',
"       \  '-synctex=1',
"       \  '-interaction=nonstopmode',
"       \  ],
"       \ }
" 
" let g:vimtex_compiler_latexmk_engines = {
"       \ '_'         : '-pdf',
"       \ 'pdflatex'  : '-pdf', 
"       \ }


"" MARKDOWN
"" source: https://jdhao.github.io/2019/01/15/markdown_edit_preview_nvim/
" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

