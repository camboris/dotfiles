filetype plugin indent on
let g:mapleader = "\<Space>"

call plug#begin('~/.config/nvim/plugged')
"colo scheme
Plug 'justinmk/molokai'
"Plug 'jdonaldson/vaxe'
" {{{
"let g:vaxe_acp_defaults = 0
" }}}

Plug 'w0rp/ale'
" {{{
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_lint_on_save = 1

" let g:ale_sign_error = "\u2639"     " sad smiley face
" let g:ale_sign_warning = "\u2614"     " umbrela under rain
let g:ale_sign_error = "EE"
let g:ale_sign_warning = "WW"

"let g:ale_sign_column_always = 1
"let g:ale_javascript_eslint_use_global = 1
let g:ale_fixers = {
  \ 'javascript': ['eslint']
  \ }
nmap <leader>d <Plug>(ale_fix)
" }}}
Plug 'tpope/vim-fugitive'
" Code commenter
Plug 'scrooloose/nerdcommenter'

Plug 'ludovicchabant/vim-gutentags'

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
" enables omni completion on haxe files
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.haxe = '[^. *\t]\.\w*'
" }}}
" Completion from other opened files
Plug 'Shougo/context_filetype.vim'
" Python autocompletion
Plug 'zchee/deoplete-jedi', { 'do': ':UpdateRemotePlugins' }
" Just to add the python go-to-definition and similar features, autocompletion
" from this plugin is disabled
Plug 'davidhalter/jedi-vim'
" {{{
" Disable autocompletion (using deoplete instead)
let g:jedi#completions_enabled = 0

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>
" }}}
" replaces autoclose
Plug 'Raimondi/delimitMate'
Plug 'justinmk/vim-sneak'
Plug 'justinmk/vim-dirvish'
Plug 'othree/html5.vim', {'for': ['html', 'htmldjango']}

"Plug 'gavocanov/vim-js-indent'
" for json
Plug 'tpope/vim-jdaddy'

Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
"{{{
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
"}}}
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
" {{{
let g:jsx_ext_required = 0

" }}}

Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
" {{{
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
" }}}
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

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
" Zen coding
Plug 'mattn/emmet-vim', { 'for': ['javascript.jsx', 'html', 'css'] }
" {{{
" use zencoding with <C-E>
let g:user_emmet_leader_key = '<c-e>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}
" }}}
Plug 'mhinz/vim-startify'
" Track the engine.
"Plug 'SirVer/ultisnips'
"" {{{
"" UltiSnips config
"inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"" }}}
"" Snippets are separated from the engine. Add this if you want them:
"Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
"{{{
let g:lightline = {
      \ 'colorscheme': 'molokai',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste', 'alestatus' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightlineModified',
      \   'readonly': 'LightlineReadonly',
      \   'fugitive': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'mode': 'LightlineMode',
      \ },
      \ 'separator': { 'left': '', 'right': ''},
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

let g:lightline.component_expand = {'alestatus': 'g:LightLineAleStatus'}

function! g:LightLineAleStatus()
    let l:s = ALEGetStatusLine()
    return ('' != l:s ? ['', l:s, '' ] : '')
endfunction

augroup alestatusupdate
    autocmd!
    autocmd BufEnter,BufRead * call ale#Queue(0)
    autocmd User ALELint call lightline#update()
augroup END


function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? '' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
"}}}
"Plug 'Shougo/neosnippet'
"" {{{
"imap <expr> <tab> neosnippet#expandable_or_jumpable() ? "\<plug>(neosnippet_expand_or_jump)" : (pumvisible() ? "\<c-n>" : "\<tab>")
"smap <expr> <tab> neosnippet#expandable_or_jumpable() ? "\<plug>(neosnippet_expand_or_jump)" : "\<tab>"

"let g:neosnippet#snippets_directory="~/.config/nvim/plugged/vim-snippets/snippets"
"" }}}
"Plug 'Shougo/neosnippet-snippets'
Plug 'ClaudiaJ/lightline-molokai.vim'
call plug#end()

" Colors and highlightings {{{
colorscheme molokai
"set guicursor=a:block-blinkon1
set guicursor=n-v-c:block-Cursor/lCursor-blinkon1,i-ci:ver25-Cursor/lCursor-blinkon1,r-cr:hor20-Cursor/lCursor
"set termguicolors
" }}}
" general {{{

:imap jj <Esc>

set inccommand=split

" tabs and spaces handling
:set expandtab
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4

set mouse=a
"set conceallevel=1
"set foldmethod=syntax

set completeopt=longest,menuone,preview

set autowrite " vaxe likes autowrite
" tablength exceptions
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript.jsx setlocal shiftwidth=2 tabstop=2

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
set wildignore+=tags "openfl"

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

autocmd CompleteDone * pclose!
" }}}
" vim: set sw=2 ts=2 et foldlevel=0 foldmethod=marker:
