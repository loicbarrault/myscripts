" Insert line between {} in insert mode
imap <C-c> <CR><Esc>O

" Comment (Normal mode)
nmap <leader>c :TComment<CR>
nmap <leader>C :TCommentBlock<CR>

" Comment (Visual mode)
vmap <leader>c :TComment<CR>
vmap <leader>C :TComment<CR>

" Center current line
nmap <space> zz
nmap n nzz
nmap N Nzz

" Tabularize
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a# :Tabularize /#<CR>
vmap <leader>a# :Tabularize /#<CR>
nmap <leader>a& :Tabularize /&<CR>
vmap <leader>a& :Tabularize /&<CR>

" Ultisnips
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-x>'

" Reload file on command
nmap <leader>q :checktime<CR>

" To disable autoindent of code
set pastetoggle=<c-2>

" My shortucts
nmap <leader>h :noh<CR>
nmap <leader>H :GitGutterLineHighlightsToggle<CR>
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>w :Gwrite<CR>
nmap <leader>gc :Gcommit -m "
nmap <leader>ga :Gcommit --amend
nmap <leader>g :Gpush<CR>
nmap <leader><S-g> :Gpull<CR>
nnoremap <tab> gt
nnoremap <S-tab> gT

" Set : and ; to be the same
nnoremap ; :

" Better splitting
nmap <leader>vs :vsplit<CR><C-W><C-L> :NERDTreeToggle<CR>

"" Better moving
" Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Tagbar
inoremap <F10> <Esc>:TagbarToggle<cr>
nnoremap <F10> :TagbarToggle<cr>

" Tabs
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
