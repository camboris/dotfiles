filetype plugin indent on
let g:mapleader = "\<Space>"

call plug#begin('~/.config/nvim/plugged')
"colo scheme
Plug 'justinmk/molokai'
" Code commenter
Plug 'scrooloose/nerdcommenter'

Plug 'ludovicchabant/vim-gutentags'

Plug 'machakann/vim-sandwich'

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
" unimpaired
Plug 'tpope/vim-unimpaired'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'Raimondi/delimitMate'
Plug 'justinmk/vim-sneak'
Plug 'justinmk/vim-dirvish'

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

Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

Plug 'itchyny/lightline.vim'
"{{{
let g:lightline = {
      \ 'colorscheme': 'molokai',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste', 'cocstatus', 'alestatus' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightlineModified',
      \   'readonly': 'LightlineReadonly',
      \   'fugitive': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'cocstatus': 'coc#status',
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
Plug 'ClaudiaJ/lightline-molokai.vim'
call plug#end()

" Colors and highlightings {{{
colorscheme molokai
"autocmd User CocNvimInit hi CocHighlightText ctermfg=0 ctermbg=215 guifg=#000000 guibg=#ffb733
autocmd User CocNvimInit hi CocHighlightText ctermfg=255 ctermbg=239 guifg=#FFFFFF guibg=#4C4745

"set guicursor=a:block-blinkon1
set guicursor=n-v-c:block-Cursor/lCursor-blinkon1,i-ci:ver25-Cursor/lCursor-blinkon1,r-cr:hor20-Cursor/lCursor
"set termguicolors
" }}}

" if hidden not set, TextEdit might fail.
set hidden

" Better display for messages
"set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)



" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

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
" vim: set sw=2 ts=2 et
