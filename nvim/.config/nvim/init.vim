filetype plugin indent on
let g:mapleader = "\<Space>"

call plug#begin('~/.config/nvim/plugged')
"colo scheme
Plug 'tomasr/molokai'
Plug 'jdonaldson/vaxe'
" {{{
let g:vaxe_acp_defaults = 0
" }}}
Plug 'benekastah/neomake'
" neomake {{{
map <F5> :Neomake!<CR>
autocmd! BufWritePost * Neomake
let g:neomake_open_list = 2
let g:neomake_airline = 1
let g:neomake_error_sign = { 'text': '✘', 'texthl': 'ErrorSign' }
let g:neomake_warning_sign = { 'text': ':(', 'texthl': 'WarningSign' }

"let g:neomake_ruby_enabled_makers = ['mri']

"map <F5> :Neomake<CR>
map <F6> :lopen<CR>
let g:neomake_javascript_jscs_maker = {
    \ 'exe': 'jscs',
    \ 'args': ['--no-color', '--preset', 'idiomatic', '--reporter', 'inline', '--esnext'],
    \ 'errorformat': '%f: line %l\, col %c\, %m',
    \ }
let g:neomake_javascript_enabled_makers = ['jscs']
" }}}
Plug 'tpope/vim-fugitive'
" Code commenter
Plug 'scrooloose/nerdcommenter'

Plug 'mbbill/undotree'
" {{{
set undofile
" Auto create undodir if not exists
let undodir = expand($HOME . '/.config/nvim/cache/undodir')
if !isdirectory(undodir)
    call mkdir(undodir, 'p')
endif
let &undodir = undodir

nnoremap <F11> :UndotreeToggle<CR>
" }}}
Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
" {{{
let g:fzf_nvim_statusline = 0 " disable statusline overwriting

nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>. :Lines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
nnoremap <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>

imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

function! SearchWordWithAg()
    execute 'Ag' expand('<cword>')
endfunction

function! SearchVisualSelectionWithAg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ag' selection
endfunction
" }}}
" Surround
Plug 'tpope/vim-surround'

" unimpaired
Plug 'tpope/vim-unimpaired'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'Shougo/deoplete.nvim' 
" {{{
  let g:deoplete#enable_at_startup = 1
" }}}
Plug 'Shougo/echodoc.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" {{{
"let g:airline_enable_tagbar=1
let g:airline#extensions#tagbar#enabled=1
let g:airline#extensions#syntastic#enabled=1
let g:airline_detect_modified=1
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1
" Tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffer_min_count = 2

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" }}}
" replaces autoclose
Plug 'Raimondi/delimitMate'
"Plug 'valloric/MatchTagAlways'
Plug 'justinmk/vim-sneak'
"Plug 'jeetsukumaran/vim-filebeagle'
Plug 'justinmk/vim-dirvish'
Plug 'othree/html5.vim', {'for': ['html', 'htmldjango']}

Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
" {{{
let g:jsx_ext_required = 0
" }}}
Plug 'gavocanov/vim-js-indent'
Plug 'tpope/vim-jdaddy'
"sass
Plug 'tpope/vim-haml', {'for': ['sass', 'css', 'scss']}
Plug 'hail2u/vim-css3-syntax', {'for': ['sass', 'css', 'scss']}
Plug 'lilydjwg/colorizer'
Plug 'airblade/vim-gitgutter'
" {{{
let g:gitgutter_enabled = 1
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
" }}}
Plug 'tpope/vim-fugitive'
" Zen coding
Plug 'mattn/emmet-vim'
" {{{
" use zencoding with <C-E>
let g:user_emmet_leader_key = '<c-e>'
" }}}
Plug 'mhinz/vim-startify'
Plug 'christoomey/vim-sort-motion'
call plug#end()


" Colors and highlightings {{{
colorscheme molokai
" }}}
" general {{{
:imap jj <Esc>

" tabs and spaces handling
:set expandtab
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4

set autowrite " vaxe likes autowrite
" tablength exceptions
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

"busqueda ignore el case
set ignorecase
"busqueda respeta el case si lo escribo
set smartcase

" line numbers
set nu

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3
set list
set listchars=tab:▸\ ,eol:¬,trail:-,nbsp:+
set clipboard+=unnamedplus
syntax enable on " turn on syntax highlighting

" autocompletition of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"
set wildignore+=export "openfl"

set spelllang=es

" }}}

" navigation {{{
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm<CR>
map tt :tabnew

map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" experimental neovim terminal mappings
if has('nvim') && exists(':tnoremap')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l
    nnoremap <A-h> <C-w>h
    nnoremap <A-j> <C-w>j
    nnoremap <A-k> <C-w>k
    nnoremap <A-l> <C-w>l

    nnoremap <silent> <leader><Enter> :tabnew<CR>:terminal<CR>

    " Opening splits with terminal in all directions
    nnoremap <Leader>h<Enter> :leftabove  vnew<CR>:terminal<CR>
    nnoremap <Leader>l<Enter> :rightbelow vnew<CR>:terminal<CR>
    nnoremap <Leader>k<Enter> :leftabove  new<CR>:terminal<CR>
    nnoremap <Leader>j<Enter> :rightbelow new<CR>:terminal<CR>
  endif

  "Make switching windows more natural
  set splitbelow
  set splitright

  " Bubble single lines
  nmap <C-Up> [e
  nmap <C-Down> ]e
  " Bubble multiple lines
  vmap <C-Up> [egv
  vmap <C-Down> ]egv

  " }}}

  " simple recursive grep {{{
  command! -nargs=1 RecurGrep lvimgrep /<args>/gj ./**/*.* | lopen | set nowrap
  command! -nargs=1 RecurGrepFast silent exec 'lgrep! <q-args> ./**/*.*' | lopen
  nmap ,R :RecurGrep 
  nmap ,r :RecurGrepFast 
  nmap ,wR :RecurGrep <cword><CR>
  nmap ,wr :RecurGrepFast <cword><CR>
  " }}}

  "varios {{{
  " show list of errors and warnings on the current file
  "nmap <leader>e :Errors<CR>

  au BufNewFile,BufRead *.as set filetype=actionscript
  au BufNewFile,BufRead *.hx set filetype=haxe
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown

  " removes trailing spaces of python files
  " (and restores cursor position)
  autocmd BufWritePre *.py mark z | %s/ *$//e | 'z

  nmap <C-Enter> <C-w><C-]><C-w>T

  autocmd FileType actionscript :set dictionary=~/.nvim/plugged/actionscript-vim-bundle/dict/actionscript.dict

  
  " }}}
  " vim: set sw=2 ts=2 et foldlevel=0 foldmethod=marker:
