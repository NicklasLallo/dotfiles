" Plugins {{{
let g:no_plugins = 'false'
let mapleader=","       " leader is comma instead of \
" Plug {{{
call plug#begin('~/.vim/plugged')
" Which-key similar to spacemacs
Plug 'liuchengxu/vim-which-key'
Plug 'PotatoesMaster/i3-vim-syntax'

" Emmet for vim
Plug 'mattn/emmet-vim'
" Use with <C-y>,

" Change how motions work
Plug 'easymotion/vim-easymotion'
" trigger with <leader><leader>
" slightly buggy if you wait for too long after <leader><leader> in
" combination with which-key

" transpose csv/tsv
Plug 'salsifis/vim-transpose'

" Plugin from git directory
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'enricobacis/vim-airline-clock'
" Linter
Plug 'w0rp/ale'
Plug 'tweekmonster/startuptime.vim'

" allows opening files with syntax: vim fileName:lineNr
Plug 'bogado/file-line'
" Cscope
"Plug '~/.vim/locals/cscope_maps.vim'

" Vim Indent Object, simple plugin that adds the 'i' text-object for current indentation level.
" Example: vii, vai, vaI, viI
" Plug 'michaeljsmith/vim-indent-object' " Replaced by vimscript in this file

" Plugin that expands the power of text-objects:
" Example: cin) will change in the next () (searches forward from cursor).
" This is mainly useful together with '.' to repeat the command many times.
" Also allows searching backwards with l (last) instead of n (next).
" Does some seeking even when n/l are missing.
" Also allows for count, ex: d2i) (delete 2 levels deep).
" Also adds many new separators, Ex: i, i. i; i: i+ i- i= i~ i_ i* i# i/ i| i\ i& i$
" Adds Argument as a text-object, Ex: cia. Arguments are comma separated lists inside braces, Ex: def func(a,b,c,d)
" Adds multi text objects, any block & any quote, Ex: inb anb Inb Anb ilb alb Ilb Alb & inq anq Inq Anq ilq alq Ilq Alq
" vanw & vanp not yet implemented. Simply doesn't touch w,W,p,P,s,S word objects (but overrides the other defaults)
Plug 'wellle/targets.vim'


" Colorthemes
Plug 'nightsense/carbonized'
Plug 'crusoexia/vim-dream'
Plug 'yuttie/hydrangea-vim'
Plug 'tomasr/molokai'
Plug 'Zabanaa/neuromancer.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'nightsense/stellarized'
Plug 'arcticicestudio/nord-vim'
Plug 'nightsense/snow'
Plug 'w0ng/vim-hybrid'
Plug 'cocopon/iceberg.vim'
Plug 'AlessandroYorba/Despacio'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'chriskempson/vim-tomorrow-theme'

" wal for colors
Plug 'dylanaraps/wal'

" Make gvim-only colorschemes work better in terminal vim
Plug 'godlygeek/csapprox'

" multifile find & replace
Plug 'brooth/far.vim'
" :Far foo bar **/*.c     This finds the pattern to replace
" :Fardo                  This does the replacement
" :Farundo                Undo in panic

" Real multiple cursors
Plug 'terryma/vim-multiple-cursors'
" Use easily with <C-n>

" Simple comment toggeling with :gcc (line) or gc (target of a motion)
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive', { 'on': [] }  " git awesomeness
Plug 'tpope/vim-surround'                " Vim-surround
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/ReplaceWithRegister'   " [\"x]gr{motion}
Plug 'AndrewRadev/splitjoin.vim'         " gS (split) & gJ (join)
Plug 'AndrewRadev/switch.vim'            " gs (switch, ex: true->false, '&&'->'||')
" if exists('##TextYankPost')
Plug 'machakann/vim-highlightedyank'
let g:highlightedyank_highlight_duration = 100
" endif
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif

Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }
autocmd! User indentLine doautocmd indentLine Syntax
if v:version >= 703
  Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
endif
if v:version >= 703
  Plug 'mhinz/vim-signify'
endif

" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Both options are optional. You don't have to install fzf in ~/.fzf
" and you don't have to run install script if you use fzf only in Vim.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'shell': '/bin/zsh' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'                " Distraction free writinga :Goyo
" Plug 'junegunn/vim-github-dashboard'  " Use with :GHD , requires ruby support
Plug 'junegunn/vim-peekaboo'            " Preview \" @ i<C-R>
Plug 'junegunn/vim-journal'             " poor mans Org-mode
Plug 'junegunn/seoul256.vim'            " Color theme
Plug 'junegunn/gv.vim'                  " git commit browse, requires fugitive, :GV
Plug 'junegunn/limelight.vim'           " Use together with goyo, :Limelight
Plug 'junegunn/rainbow_parentheses.vim'

" The ultimate undo history visualizer for VIM
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
" NERDTree... tree explorer for vim
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
augroup nerd_loader
  autocmd!
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd BufEnter,BufNew *
        \  if isdirectory(expand('<amatch>'))
        \|   call plug#load('nerdtree')
        \|   execute 'autocmd! nerd_loader'
        \| endif
augroup END

" Nerdtree show git status
Plug 'Xuyuanp/nerdtree-git-plugin'

" highlight file icons with different colors
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()
" }}}
" Vim Fugitive {{{
" only allow dp & do while using fugitive to avoid any pauses while pressing d
" in other modes.
autocmd BufRead fugitive\:* xnoremap <buffer> dp :diffput<cr>|xnoremap <buffer> do :diffget<cr>
command! Gstatus call LazyLoadFugitive('Gstatus')
command! Gdiff call LazyLoadFugitive('Gdiff')
command! Glog call LazyLoadFugitive('Glog')
command! Gblame call LazyLoadFugitive('Gblame')
command! Gcd call LazyLoadFugitive('Gcd')

function! LazyLoadFugitive(cmd)
  call plug#load('vim-fugitive')
  call fugitive#detect(expand('%:p'))
  exe a:cmd
endfunction
" }}}
" WhichKey {{{
call which_key#register(',', "g:which_key_map")
nnoremap <silent> <leader> :WhichKey ','<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual ','<CR>
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" By default timeoutlen is 1000ms
set timeoutlen=1000
" Define prefix dictionary
let g:which_key_map =  {}
" Ignore <leader> <number>
" let g:which_key_map['1'] = 'which_key_ignore'
" let g:which_key_map.2 = 'which_key_ignore'
" let g:which_key_map.3 = 'which_key_ignore'
" let g:which_key_map.4 = 'which_key_ignore'
" let g:which_key_map.5 = 'which_key_ignore'
" let g:which_key_map.6 = 'which_key_ignore'
" let g:which_key_map.7 = 'which_key_ignore'
" let g:which_key_map.8 = 'which_key_ignore'
" let g:which_key_map.9 = 'which_key_ignore'
let g:which_key_map['a'] = ':Ag Fuzzy search'
let g:which_key_map['g'] = ':Tags Fuzzy search'
let g:which_key_map['w'] = 'Write / Save'
let g:which_key_map['i'] = 'Toggle Invisible'
let g:which_key_map['l'] = 'Go To last Tab'

let g:which_key_map['n'] = {'name' : '+NERDTree'}
let g:which_key_map['e'] = {'name' : '+Edit file'}

let g:which_key_map['c'] = {'name' : '+Cscope under cursor search'}
let g:which_key_map['c']['s'] = 'Find C symbol'
let g:which_key_map['c']['g'] = 'Find definition'
let g:which_key_map['c']['d'] = 'Find funcs called by'
let g:which_key_map['c']['c'] = 'Find funcs calling'
let g:which_key_map['c']['t'] = 'Find text string'
let g:which_key_map['c']['e'] = 'Find egrep pattern'
let g:which_key_map['c']['f'] = 'Find file name'
let g:which_key_map['c']['i'] = 'Find files which #include'
let g:which_key_map['c']['a'] = 'Find where assigned a value'

let g:which_key_map['d'] = {'name' : '+Cscope Querry Fuzzy search'}
let g:which_key_map['d']['s'] = 'Find C symbol'
let g:which_key_map['d']['g'] = 'Find definition'
let g:which_key_map['d']['d'] = 'Find funcs called by'
let g:which_key_map['d']['c'] = 'Find funcs calling'
let g:which_key_map['d']['t'] = 'Find text string'
let g:which_key_map['d']['e'] = 'Find egrep pattern'
let g:which_key_map['d']['f'] = 'Find file name'
let g:which_key_map['d']['i'] = 'Find files which #include'
let g:which_key_map['d']['a'] = 'Find where assigned a value'
" let g:which_key_map[','] = {
"       \ 'name' : '+leader' ,
"        \ 'w' : ['<C-W>w'     , 'other-window']          ,
"        \ 'd' : ['<C-W>c'     , 'delete-window']         ,
"       \ }
" }}}
" Airline {{{
" Airline Themes {{{
let g:airline_theme='deus'
" let g:AirlineTheme='deus'
"}}}
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_buffers = 0

" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
"let g:airline_mode_map = {
"      \ '__' : '-',
"      \ 'n'  : 'N',
"      \ 'i'  : 'I',
"      \ 'R'  : 'R',
"      \ 'c'  : 'C',
"      \ 'v'  : 'V',
"      \ 'V'  : 'V',
"      \ '' : 'V',
"      \ 's'  : 'S',
"      \ 'S'  : 'S',
"      \ '' : 'S',
"      \ }

" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif

    " unicode symbols
    " let g:airline_left_sep = '»'
    " let g:airline_left_sep = '▶'
    " let g:airline_right_sep = '«'
    " let g:airline_right_sep = '◀'
    " let g:airline_symbols.crypt = '🔒'
    " let g:airline_symbols.linenr = '☰'
    " let g:airline_symbols.linenr = '␊'
    " let g:airline_symbols.linenr = '␤'
    " let g:airline_symbols.linenr = '¶'
    " let g:airline_symbols.maxlinenr = ''
    " let g:airline_symbols.maxlinenr = '㏑'
    " let g:airline_symbols.branch = '⎇'
    " let g:airline_symbols.paste = 'ρ'
    " let g:airline_symbols.paste = 'Þ'
    " let g:airline_symbols.paste = '∥'
    " let g:airline_symbols.spell = 'Ꞩ'
    " let g:airline_symbols.notexists = 'Ɇ'
    " let g:airline_symbols.whitespace = 'Ξ'

"     " powerline symbols
"     let g:airline_left_sep = ''
"     let g:airline_left_alt_sep = ''
"     let g:airline_right_sep = ''
"     let g:airline_right_alt_sep = ''
"     let g:airline_symbols.branch = ''
"     let g:airline_symbols.readonly = ''
"     let g:airline_symbols.linenr = '☰'
"     let g:airline_symbols.maxlinenr = ''


" }}}
" FZF {{{

" When run from gvim  without terminal features open a new window
let g:fzf_launcher= 'gnome-terminal --disable-factory --hide-menubar --geometry=100x34+1735+502 -x zsh -ic %s'
" Hide statusline of terminal buffer, not always needed
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Gives the preview window when searching :Files
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"let g:fzf_launcher= 'urxvt -geometry 120*30 -e sh -c %s'
" set fzf's default input to fd instead of find. This also removes gitignore etc

" let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --color=always --exclude .git'
" let $FZF_DEFAULT_OPTS="--extended"
"let g:fzf_files_options = '--preview "(head -'.&lines.' | rougify {} || bat --color \"always\" --line-range 0:100 {} || head -'.&lines.' {})"'

function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction


nnoremap <silent> <C-b> :call FZFOpen(':Buffers')<CR>
nnoremap <silent> <C-g>g :call FZFOpen(':Ag')<CR>
nnoremap <silent> <leader>a :call FZFOpen(':Ag')<CR>
nnoremap <silent> <leader>g :call FZFOpen(':Tags')<CR>
nnoremap <silent> <C-g>c :call FZFOpen(':Commands')<CR>
nnoremap <silent> <C-g>l :call FZFOpen(':BLines')<CR>
nnoremap <silent> <C-a-p> :call FZFOpen(':Files')<CR>
nnoremap <silent> <C-f> :call FZFOpen(':Files')<CR>
nnoremap <silent> <C-h> :call FZFOpen(':History')<CR>
" nnoremap <silent> <C-p> :call FZFOpen(':call Fzf_dev()')<CR>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" }}}
" NERDTree {{{
let g:NERDTreeIgnore = [
      \ '\.vim$',
      \ '\~$',
      \ '\.beam',
      \ 'elm-stuff',
      \ 'deps',
      \ '_build',
      \ '.git',
      \ 'node_modules',
      \ 'tags',
      \ ]

let NERDTreeHijackNetrw=1
let g:NERDTreeShowHidden = 1
let g:NERDTreeAutoDeleteBuffer=1
" keep alternate files and jumps
let g:NERDTreeCreatePrefix='silent keepalt keepjumps'
"
" Open NERDTree if vim was started in empty buffer
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


augroup NERDTreeAuCmds
  autocmd!
  autocmd FileType nerdtree nmap <buffer> <expr> - g:NERDTreeMapUpdir
augroup END
" move up a directory with "-" like using vim-vinegar or netrw (usually "u" does that)
" }}}
" UndoTree {{{
" Not quite undo related but enough so
" set where swap file and undo/backup files are saved
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif
" }}}
" EasyAlign {{{
"" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Example vipga= - v_isual-select i_nner p_aragraph, EasyAlight (ga), align around symbol (=)
" Example gaip=  - EasyAlign (ga) for i_nner p_aragraph, align around symbol (=)
" = Around 1st occurrence
" 2= Around 2nd occurrance
" *= Around all occurances
" **= Left/Right alternatig alignment around all occurrences
" <Enter> Switching between left/right/center alighment modes

" Common usage
" gaip2<Space>

" }}}
" cscope & ctags{{{

if has('cscope')
    set cscopetag "Include cscope when searchig for tags

    if filereadable("cscope.out")
        cs add cscope.out
    " else add the database pointed to by environment variable
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    if has('quickfix')
        set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
    endif

    " cnoreabbrev csa cs add
    " cnoreabbrev csf cs find
    " cnoreabbrev csk cs kill
    " cnoreabbrev csr cs reset
    " cnoreabbrev css cs show
    " cnoreabbrev csh cs help

    " Fills the quickfix st
    "  s: Find this C symbol
    "  g: Find this definition
    "  d: Find functions called by this function
    "  c: Find functions calling this function
    "  t: Find this text string
    "  e: Find this egrep pattern
    "  f: Find this file
    "  i: Find files #including this file
    "  a: Find places where this symbol is assigned a value

    nmap <C-c>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <F2> :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-c>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <F3> :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-c>d :cs find d <C-R>=expand("<cword>")<CR><CR>
    nmap <C-c>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <F4> :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-c>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-c>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-c>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-c>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-c>a :cs find a <C-R>=expand("<cfile>")<CR><CR>


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

    nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-Space>a :scs find a <C-R>=expand("<cfile>")<CR><CR>


    " Hitting CTRL-space *twice* before the search type does a vertical
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-Space><C-Space>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space><C-Space>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space><C-Space>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space><C-Space>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space><C-Space>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space><C-Space>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space><C-Space>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-Space><C-Space>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-Space><C-Space>a :vert scs find a <C-R>=expand("<cword>")<CR><CR>


    " command -nargs=0 Cscope cs add $VIMRC/src/cscope.out $VIMRC/src
    " cs add ~/.vim/src/ebb_cscope.out /repo/
    set cscopeverbose " show message when loading cscope database
endif

set tags=./tags;/

" }}}
" FZF + cscope{{{

function! Cscope(option, query)
  let color = '{ x = $1; $1 = ""; z = $3; $3 = ""; printf "\033[34m%s\033[0m:\033[31m%s\033[0m\011\033[37m%s\033[0m\n", x,z,$0; }'
  let opts = {
  \ 'source':  "cscope -dL" . a:option . " " . a:query . " | awk '" . color . "'",
  \ 'options': ['--ansi', '--prompt', '> ',
  \             '--multi', '--bind', 'alt-a:select-all,alt-d:deselect-all',
  \             '--color', 'fg:188,fg+:222,bg+:#3a3a3a,hl+:104'],
  \ 'down': '40%'
  \ }
  function! opts.sink(lines)
    let data = split(a:lines)
    let file = split(data[0], ":")
    execute 'e ' . '+' . file[1] . ' ' . file[0]
  endfunction
  call fzf#run(opts)
endfunction

function! CscopeQuery(option)
  call inputsave()
  if a:option == '0'
    let query = input('Assignments to: ')
  elseif a:option == '1'
    let query = input('Functions calling: ')
  elseif a:option == '2'
    let query = input('Functions called by: ')
  elseif a:option == '3'
    let query = input('Egrep: ')
  elseif a:option == '4'
    let query = input('File: ')
  elseif a:option == '6'
    let query = input('Definition: ')
  elseif a:option == '7'
    let query = input('Files #including: ')
  elseif a:option == '8'
    let query = input('C Symbol: ')
  elseif a:option == '9'
    let query = input('Text: ')
  else
    echo "Invalid option!"
    return
  endif
  call inputrestore()
  if query != ""
    call Cscope(a:option, query)
  else
    echom "Cancelled Search!"
  endif
endfunction

nnoremap <silent> <Leader>ca :call Cscope('0', expand('<cword>'))<CR>
nnoremap <silent> <Leader>cc :call Cscope('1', expand('<cword>'))<CR>
nnoremap <silent> <Leader>cd :call Cscope('2', expand('<cword>'))<CR>
nnoremap <silent> <Leader>ce :call Cscope('3', expand('<cword>'))<CR>
nnoremap <silent> <Leader>cf :call Cscope('4', expand('<cword>'))<CR>
nnoremap <silent> <Leader>cg :call Cscope('6', expand('<cword>'))<CR>
nnoremap <silent> <Leader>ci :call Cscope('7', expand('<cword>'))<CR>
nnoremap <silent> <Leader>cs :call Cscope('8', expand('<cword>'))<CR>
nnoremap <silent> <Leader>ct :call Cscope('9', expand('<cword>'))<CR>

nnoremap <silent> <Leader>cqa :call CscopeQuery('0')<CR>

nnoremap <silent> <Leader>da :call CscopeQuery('0')<CR>
nnoremap <silent> <Leader>dc :call CscopeQuery('1')<CR>
nnoremap <silent> <Leader>dd :call CscopeQuery('2')<CR>
nnoremap <silent> <Leader>de :call CscopeQuery('3')<CR>
nnoremap <silent> <Leader>df :call CscopeQuery('4')<CR>
nnoremap <silent> <Leader>dg :call CscopeQuery('6')<CR>
nnoremap <silent> <Leader>di :call CscopeQuery('7')<CR>
nnoremap <silent> <Leader>ds :call CscopeQuery('8')<CR>
nnoremap <silent> <Leader>dt :call CscopeQuery('9')<CR>

" After loading into quickfix navigate the results using
nnoremap <Leader>j :cnext<CR>
nnoremap <Leader>k :cprevious<CR>

" }}}
" Other {{{
" Multi cursor
let g:multi_cursor_prev_key = '<C-S-n>'
" Only return from visual to normal
let g:multi_cursor_exit_from_visual_mode = 0
" Only return from insert to normal
let g:multi_cursor_exit_from_insert_mode = 0
nnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>
vnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>
nmap <F8> :TagbarToggle<CR>
IndentLinesEnable " Display a small line with each indentationlevel
" vim-signify
let g:signify_vcs_list = ['git']
let g:signify_skip_filetype = { 'journal': 1 }
" let g:signify_sign_add          = '│'
" let g:signify_sign_change       = '│'
" let g:signify_sign_changedelete = '│'
"}}}

" Enable the fuzzy finder fzf
" set rtp+=~/.fzf
" }}}
"Intro Settings {{{
if version > 600
  filetype plugin indent on
endif


set laststatus=2 "always show the powerline statusbar in all windows
set showtabline=2 "always display the tabline, even if there is only one tab


if has('gui_running')
  set background=dark
  colorscheme gruvbox
else
  colorscheme seoul256
  set background=dark
    if has('terminal') && !(&term ==# 'xterm-kitty') && !(&term ==# 'xterm-256color')
        " Avoid setting this variable when it is not absolutely neccesary
        " since it is very very slow (10 times as long startuptime as
        " everything else combined)
        set term=xterm-256color " Falls back to 'xterm' if it does not start with xtert
    endif
endif

" set t_Co=256            " forces 256 colors so I don't have to change $TERM

" makes the background disapear (so that it uses default terminal color and transparency)
" hi Normal ctermbg=NONE

highlight ExtraWhitespace ctermbg=red guibg=darkgreen
if has('autocmd')
augroup maingroup
    autocmd!
" if colorschemes mess up the highlights
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    autocmd filetype html, xml set listchars-=tab:>.
endif

match ExtraWhitespace /[^\t]\zs\t\+/    "Show tabs that are not at the start of a line
" :match ExtraWhitespace /\s\+$\| \+\ze\t/ "Show trailing whitespace and space before a tab

" Except when typing that line:
match ExtraWhitespace /\s\+\%#\@<!$\| \+\ze\t/
":autocmd InsertLeave * redraw!
":match "Switch off :match highlighting.

" to avoid screen flashing use this
":au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
":au InsertLeave * match ExtraWhitespace /\s\+$/

" apply highlighting in all windows and not only current
":autocmd BufWinEnter * match ExtraWhitespace /^\s* \s*\|\s\+$/
" autocmd BufWinLeave * call clearmatches()

"Another way to find trailing whitespace, I toggle in lintmode
"set list                " needed for listchars
set listchars=tab:>-,trail:.,extends:#,nbsp:~


" }}}
 " Basic Settings {{{
syntax enable         " enables syntax highlighting
set guioptions=
"set termguicolors
"set shell="/bin/zsh"
"set shellredir=">%s 2>&1"
"set shellpipe="2>&1| tee"
set backspace=indent,eol,start
set nobackup          " most files are in git anyways
set encoding=utf-8    " usually the case rather than latin1
set textwidth=0       " disable automatic word wrapping (newlines)
set hidden            " preserve buffers by hiding instead of closing them
set showtabline=4     " t
set tabstop=4         " number of visual spaces per tab
set softtabstop=4     " number of spaces in tab when editing
set shiftwidth=4      " number of spaces used for autoindent, command: <<, >>, == (auto entire doc: gg=G)
set expandtab         " tabs are converted into spaces
set shiftround        " use multiples of shiftwidth when indenting with '<' and '>'
set number            " show line numbers
set relativenumber    " line numbers are relative to cursor position
set showcmd           " show command in bottom bar
set cursorline        " highlight current line
set wildmenu          " visual autocomplete for command menu
"set wildmode=list:longest,list:full " configure wildmenu
"set lazyredraw          " redraw less often
set showmatch         " highlight matching {[()]}
set incsearch         " display search results while writing
set hlsearch          " high light search results
set ignorecase        " ignore case when searching
set smartcase         " ignore case if search pattern is all lowercase, otherwise case-sensitive
set wrapscan          " wrap the searches around the document (/ ?)
set ttyfast           " faster redraws
set history=1000      " save a much longer history (default 50) of commands and searches
set undolevels=1000   " save more levels of undo
set foldenable        " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10    " 10 nested fold max
set foldmethod=manual
set iskeyword+=-      " Treat dash separated words as word text objects (for ciw etc)
" set foldcolumn=1
set mouse=a           " enable mouse
set scrolloff=9       " center coursor
set nocp              " 'compatible' is not set
" set autochdir         " Change directory to the current buffer when opening files.
set background=dark
"set foldmethod=indent   " fold based on indent level alternatives are: marker, manual, expr, syntax, diff, run :help foldmethod for info
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.class
set title             " change the title of the terminal
"set visualbell          " don't beep
set noerrorbells      " don't beep
set clipboard=unnamedplus " Copy & Paste with the system clipboard (the + register)
set modelines=1       " user last line of file for modelines
set autoread          " automatically reread the file if it was changed from the outside without asking first
set wrap              " wrap lines
set autoindent
set smartindent
set noshowmode        " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set formatoptions+=1  " Make pasting big things slightly smarter
if has('patch-7.3.541')
  set formatoptions+=j
endif
if has('patch-7.4.338')
  let &showbreak = '↳ '  " Distinguish wrapped lines slightly easier
  set breakindent        " retain indent
  set breakindentopt=sbr " Show the symbol
endif
" Annoying temporary files
" set backupdir=/tmp//,.
" set directory=/tmp//,.
" if v:version >= 703
"   set undodir=/tmp//,.
" endif
if exists('&guioptions')
    " cursor behaviour:
    " - no blinking in normal/visual mode
    " - blinking in insert-mode
    set guicursor+=a:blinkon0
    " set guicursor+=n-v-c:blinkon0,i-ci:ver25-Cursor/lCursor-blinkwait300-blinkoff500-blinkon500
endif

if has("gui_running")
    "set guifont=Source\ Code\ Pro\ for\ Powerline\ Regular:15
    "set guifont=Source\ Code\ Pro\ for\ Powerline:h16:cANSI
    " set guifont=Source\ Code\ Pro\ for\ Powerline\ 12
endif

" vim hardcodes background color erase even if the terminfo file does
" not contain bce (not to mention that libvte based terminals
" incorrectly contain bce in their terminfo files). This causes
" incorrect background rendering when using a color theme with a
" background color.
let &t_ut=''

" }}}
" Keybindings {{{
" nnoremap {{{
" space open/closes folds
nnoremap <space> za
" visualy select last inserted text
nnoremap gV `[V`]
" edit this file
nnoremap <silent> <leader>ev :tabedit $MYVIMRC<CR>
" source this file after edits
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>
" edit the .zshrc file
nnoremap <silent> <leader>ec :tabedit ~/.zshrc<CR>
" edit the .cshrc.user file
nnoremap <silent> <leader>ec :tabedit ~/.cshrc.user<CR>
" remove any search highlighting
nnoremap <leader><space> :nohlsearch<CR>
" `gf` opens file under cursor in new vertical split
nnoremap gf :vertical wincmd f<CR>
" move visual lines instead of real lines, less confusing together with wraping lines
nnoremap j gj
nnoremap k gk
" move to beggining and end of line with capital B/E, overrides.
" Normaly B & E functions almost identically to the more used b & e (or w) anyways, so overriding is fine
nnoremap B ^
nnoremap E $

" tags navigation
" Go to definition (requires Ctags)
nnoremap <C-d> <C-]>
" Go back <C-t>


" Super Save, save all windows as a session, reopen with vim -S (vim/gvim/nvim -S)
nnoremap <leader>s :mksession<CR>
" Fast Saving
nnoremap <leader>w :w!<CR>
" Fast tab
nnoremap <leader>t :tabnew<CR>
" Fast tab switching (Leader+Last)
let g:lasttab = 1
nnoremap <leader>l :exe "tabn ".g:lasttab<CR>
autocmd TabLeave * let g:lasttab = tabpagenr()

nnoremap <silent> <leader>i :call ToggleCC()<CR>
"show trailing whitespaces, somewhat exessive
nnoremap <silent> <C-T> /\S\zs\s\+$

" Replaced gundo with UndoTree, pure vimscript instead of dependencies
nnoremap <leader>u :UndotreeToggle<CR>

" open a new tab in the current buffer's path
" very useful when editing files in the same directory
" TODO combine with Vexplore and make more convinent
" nnoremap <leader>e :tabedit <c-r>=expand("%:p:h")<CR>/<CR>

" toggle NERDTree
nnoremap <silent> <Leader>nt :NERDTreeToggle<CR>
" not necessarily NTree related but uses NERDTree because I have it setup
nnoremap <leader>nd :e %:h<CR>

" Quick Search/Replace
nnoremap <leader>f :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <leader>% :%s/\<<C-r>=expand('<cword>')<CR>\>/

" allows jk to function like esc while in insert mode, if you ever need to write jk then wait a few sec between the letters - Removed because it interfered with multipleCursors which was more useful
"inoremap jk <esc>

" }}}
" vnoremap {{{

" Visual Mode pressing * or # searches for the current selection
" Very useful for finding all occurances of something
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap < <gv
vnoremap > >gv
vnoremap <C-k> :m-2<CR>gv
vnoremap <C-j> :m '>+<CR>gv


" make visual selection dot-able
vnoremap . :norm. &lt;CR&lt;

" leader+number jumps to window number, same as number<C-w><C-w> for those who prefer that
" let yi = 1
" while yi <=9
"     execute 'nnoremap <Leader>' . yi . ':' . yi . 'wincmd w<CR>'
"     let yi = yi +1
" endwhile

" }}}
" inoremap {{{

inoremap (<CR> (<CR><SPACE><CR>)<Esc>k$xa
inoremap {<CR> {<CR><SPACE><CR>}<Esc>k$xa

inoremap ,, <C-x><C-o><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>" : ",,"<CR>
inoremap ,; <C-n><C-r>=pumvisible()      ? "\<lt>Down>\<lt>C-p>\<lt>Down>" : ",;"<CR>
inoremap ,: <C-x><C-f><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>" : ",:"<CR>
inoremap ,= <C-x><C-l><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>" : ",="<CR>
" }}}
" }}}
" Functions {{{
" Visual Selection tool {{{
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmDLine("%s" . '\'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction
"}}}
" Toggle ColorColumn {{{
" Toggle with leader+l
function! ToggleCC()
  if exists("t:ccline")
    unlet t:ccline
    let &colorcolumn=join(range(100,999),',')
    set list
  else
    let t:ccline = winnr()
    set colorcolumn=0
    set list!
    redraw!
  endif
endfuncti

" }}}
" make list-like commands more intuitive {{{
function! CCR()
    let cmdline = getcmdline()
    if cmdline =~ '\v\C^(ls|files|buffers)'
        " like :ls but prompts for a buffer command
        return "\<CR>:b"
    elseif cmdline =~ '\v\C/(#|nu|num|numb|numbe|number)$'
        " like :g//# but prompts for a command
        return "\<CR>:"
    elseif cmdline =~ '\v\C^(dli|il)'
        " like :dlist or :ilist but prompts for a count for :djump or :ijump
        return "\<CR>:" . cmdline[0] . "j  " . split(cmdline, " ")[1] . "\<S-Left>\<Left>"
    elseif cmdline =~ '\v\C^(cli|lli)'
        " like :clist or :llist but prompts for an error/location number
        return "\<CR>:sil " . repeat(cmdline[0], 2) . "\<Space>"
    elseif cmdline =~ '\C^old'
        " like :oldfiles but prompts for an old file to edit
        set nomore
        return "\<CR>:sil se more|e #<"
    elseif cmdline =~ '\C^changes'
        " like :changes but prompts for a change to jump to
        set nomore
        return "\<CR>:sil se more|norm! g;\<S-Left>"
    elseif cmdline =~ '\C^ju'
        " like :jumps but prompts for a position to jump to
        set nomore
        return "\<CR>:sil se more|norm! \<C-o>\<S-Left>"
    elseif cmdline =~ '\C^marks'
        " like :marks but prompts for a mark to jump to
        return "\<CR>:norm! `"
    elseif cmdline =~ '\C^undol'
        " like :undolist but prompts for a change to undo
        return "\<CR>:u "
        " Propmpt pastes the selected register content
    elseif cmdline =~ '\C^reg'
        return "\<CR>:norm! \"p\<Left>"
    else
        return "\<CR>"
    endif
endfunction
cnoremap <expr> <CR> CCR()
" }}}
" Most Recently Used allows you to open files from :oldfile easily. {{{
" Use together with tab-completion
" MRU command-line completion
function! s:MRUComplete(ArgLead, CmdLine, CursorPos)
    return filter(copy(v:oldfiles), 'v:val =~ a:ArgLead')
endfunction

" MRU function
function! s:MRU(command, arg)
    if a:command == "tabedit"
        execute a:command . " " . a:arg . "|lcd %:p:h"
    else
        execute a:command . " " . a:arg
    endif
endfunction

" commands
command! -nargs=1 -complete=customlist,<sid>MRUComplete ME call <sid>MRU('edit', <f-args>)
command! -nargs=1 -complete=customlist,<sid>MRUComplete MS call <sid>MRU('split', <f-args>)
command! -nargs=1 -complete=customlist,<sid>MRUComplete MV call <sid>MRU('vsplit', <f-args>)
command! -nargs=1 -complete=customlist,<sid>MRUComplete MT call <sid>MRU('tabedit', <f-args>)
" }}}
" Color scheme selector <F7> {{{
function! s:colors(...)
  return filter(map(filter(split(globpath(&rtp, 'colors/*.vim'), "\n"),
        \                  'v:val !~ "^/usr/"'),
        \           'fnamemodify(v:val, ":t:r")'),
        \       '!a:0 || stridx(v:val, a:1) >= 0')
endfunction

function! s:rotate_colors()
  if !exists('s:colors')
    let s:colors = s:colors()
  endif
  let name = remove(s:colors, 0)
  call add(s:colors, name)
  execute 'colorscheme' name
  redraw
  echo name
endfunction
nnoremap <silent> <F7> :call <SID>rotate_colors()<cr>

" }}}
" :A opens corresponding header/source file for c projects {{{
function! s:a(cmd)
  let name = expand('%:r')
  let ext = tolower(expand('%:e'))
  let sources = ['c', 'cc', 'cpp', 'cxx']
  let headers = ['h', 'hh', 'hpp', 'hxx']
  for pair in [[sources, headers], [headers, sources]]
    let [set1, set2] = pair
    if index(set1, ext) >= 0
      for h in set2
        let aname = name.'.'.h
        for a in [aname, toupper(aname)]
          if filereadable(a)
            execute a:cmd a
            return
          end
        endfor
      endfor
    endif
  endfor
endfunction
command! A call s:a('e')
command! AV call s:a('botright vertical split')
" }}}
" :EX gives +x permission to active file {{{
command! EX if !empty(expand('%'))
         \|   write
         \|   call system('chmod +x '.expand('%'))
         \|   silent e
         \| else
         \|   echohl WarningMsg
         \|   echo 'Save the file first'
         \|   echohl None
         \| endif
" }}}
" <Leader>?/! | Google it / Feeling lucky {{{
function! s:goog(pat, lucky)
  let q = '"'.substitute(a:pat, '["\n]', ' ', 'g').'"'
  let q = substitute(q, '[[:punct:] ]',
       \ '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
  call system(printf('open "https://www.google.com/search?%sq=%s"',
                   \ a:lucky ? 'btnI&' : '', q))
endfunction

nnoremap <leader>? :call <SID>goog(expand("<cWORD>"), 0)<cr>
nnoremap <leader>! :call <SID>goog(expand("<cWORD>"), 1)<cr>
xnoremap <leader>? "gy:call <SID>goog(@g, 0)<cr>gv
xnoremap <leader>! "gy:call <SID>goog(@g, 1)<cr>gv
" }}}
" text objects {{{
" ?ii / ?ai | indent-object {{{
" ?io       | strictly-indent-object
function! s:indent_len(str)
  return type(a:str) == 1 ? len(matchstr(a:str, '^\s*')) : 0
endfunction

function! s:indent_object(op, skip_blank, b, e, bd, ed)
  let i = min([s:indent_len(getline(a:b)), s:indent_len(getline(a:e))])
  let x = line('$')
  let d = [a:b, a:e]

  if i == 0 && empty(getline(a:b)) && empty(getline(a:e))
    let [b, e] = [a:b, a:e]
    while b > 0 && e <= line('$')
      let b -= 1
      let e += 1
      let i = min(filter(map([b, e], 's:indent_len(getline(v:val))'), 'v:val != 0'))
      if i > 0
        break
      endif
    endwhile
  endif

  for triple in [[0, 'd[o] > 1', -1], [1, 'd[o] < x', +1]]
    let [o, ev, df] = triple

    while eval(ev)
      let line = getline(d[o] + df)
      let idt = s:indent_len(line)

      if eval('idt '.a:op.' i') && (a:skip_blank || !empty(line)) || (a:skip_blank && empty(line))
        let d[o] += df
      else | break | end
    endwhile
  endfor
  execute printf('normal! %dGV%dG', max([1, d[0] + a:bd]), min([x, d[1] + a:ed]))
endfunction
xnoremap <silent> ii :<c-u>call <SID>indent_object('>=', 1, line("'<"), line("'>"), 0, 0)<cr>
onoremap <silent> ii :<c-u>call <SID>indent_object('>=', 1, line('.'), line('.'), 0, 0)<cr>
xnoremap <silent> ai :<c-u>call <SID>indent_object('>=', 1, line("'<"), line("'>"), -1, 1)<cr>
onoremap <silent> ai :<c-u>call <SID>indent_object('>=', 1, line('.'), line('.'), -1, 1)<cr>
xnoremap <silent> io :<c-u>call <SID>indent_object('==', 0, line("'<"), line("'>"), 0, 0)<cr>
onoremap <silent> io :<c-u>call <SID>indent_object('==', 0, line('.'), line('.'), 0, 0)<cr>
" }}}
" Various {{{
" <Leader>I/A | Prepend/Append to all adjacent lines with same indentation
nmap <silent> <leader>I ^vio<C-V>I
nmap <silent> <leader>A ^vio<C-V>$A
" ?il | inner line
xnoremap <silent> il <Esc>^vg_
onoremap <silent> il :<C-U>normal! ^vg_<CR>
" }}}
" ?ic | inner comment {{{
function! s:inner_comment(vis)
  if synIDattr(synID(line('.'), col('.'), 0), 'name') !~? 'comment'
    call s:textobj_cancel()
    if a:vis
      normal! gv
    endif
    return
  endif

  let origin = line('.')
  let lines = []
  for dir in [-1, 1]
    let line = origin
    let line += dir
    while line >= 1 && line <= line('$')
      execute 'normal!' line.'G^'
      if synIDattr(synID(line('.'), col('.'), 0), 'name') !~? 'comment'
        break
      endif
      let line += dir
    endwhile
    let line -= dir
    call add(lines, line)
  endfor

  execute 'normal!' lines[0].'GV'.lines[1].'G'
endfunction
xmap <silent> ic :<C-U>call <SID>inner_comment(1)<CR><Plug>(TOC)
omap <silent> ic :<C-U>call <SID>inner_comment(0)<CR><Plug>(TOC)
" }}}
" }}}
" goyo.vim + limelight.vim {{{
let g:limelight_paragraph_span = 1
let g:limelight_priority = -1

function! s:goyo_enter()
  if has('gui_running')
    set fullscreen
    set background=light
    set linespace=7
  elseif exists('$TMUX')
    silent !tmux set status off
  endif
  Limelight
  let &l:statusline = '%M'
  hi StatusLine ctermfg=red guifg=red cterm=NONE gui=NONE
endfunction

function! s:goyo_leave()
  if has('gui_running')
    set nofullscreen
    set background=dark
    set linespace=0
  elseif exists('$TMUX')
    silent !tmux set status on
  endif
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <Leader>G :Goyo<CR>
" }}}
" gv.vim {{{
function! s:gv_expand()
  let line = getline('.')
  GV --name-status
  call search('\V'.line, 'c')
  normal! zz
endfunction

autocmd! FileType GV nnoremap <buffer> <silent> + :call <sid>gv_expand()<cr>
" }}}
" }}}
" Netrw {{{
" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 1  " open new files in previous window (no new splits)
let g:netrw_altv = 1          " Split to hte right instead of the left
let g:netrw_banner = 0        " removes the banner
let g:netrw_winsize = 22      " makes the file browsing tree take up only 20% of the screen instead of 50%
let g:netrw_liststyle= 3      " tree view when using netrw (file browsing)


" }}}
" Status Line {{{

" Find out current buffer's size and output it.
function! FileSize()
    let bytes = getfsize(expand('%:p'))
    if (bytes >= 1024)
        let kbytes = bytes / 1024
    endif
    if (exists('kbytes') && kbytes >= 1024)
        let mbytes = kbytes / 1024
    endif

    if bytes <= 0
        return '0'
    endif

    if (exists('mbytes'))
        return mbytes . 'MB ' . (kbytes%1024) . 'KB ' . (bytes%1024) . 'B ' "modulo to see the full size
    elseif (exists('kbytes'))
        return kbytes . 'KB ' . (bytes%1024) . 'B '
    else
        return bytes . 'B'
    endif
endfunction

function! ReadOnly()
    if &readonly || !&modifiable
        return '[RO]'
    else
        return ''
endfunction

"function! GitInfo()
"    let git=fugitive#head()
"    if git!= ''
"        return 'î '.fugitive#head()
"    else
"       return ''
"endfunction

set laststatus=2                                            " Always show statusline

hi User1 ctermfg=007 guibg=NONE guifg=NONE
hi User2 ctermfg=008 guibg=NONE guifg=NONE
hi User3 gui=bold,reverse ctermfg=008 guibg=bg guifg=#cec03c
hi User4 ctermfg=008 guibg=NONE guifg=NONE
hi User5 ctermfg=008 guibg=NONE guifg=NONE
hi User6 ctermfg=008 guibg=NONE guifg=NONE
hi User7 ctermfg=008 guibg=NONE guifg=NONE
hi User8 ctermfg=008 guibg=NONE guifg=NONE
hi User9 ctermfg=007 guifg=NONE guifg=NONE



if g:no_plugins ==# 'true'
    set statusline=%!StatusLine('active')
    augroup MyStatusLine
    autocmd!
    autocmd WinEnter * setl statusline=%!StatusLine('active')
    autocmd WinLeave * setl statusline=%!StatusLine('inactive')
    if exists('#TextChangedI')
        autocmd BufWinEnter,BufWritePost,FileWritePost,TextChanged,TextChangedI,WinEnter,InsertEnter,InsertLeave,CmdWinEnter,CmdWinLeave,ColorScheme * call GetMode()
    else
        autocmd BufWinEnter,BufWritePost,FileWritePost,WinEnter,InsertEnter,InsertLeave,CmdWinEnter,CmdWinLeave,ColorScheme * call GetMode()
    endif
    augroup END
endif

function! StatusLine(mode) abort
  let l:line=''

  " help or man pages
  if &filetype ==# 'help' || &filetype ==# 'man'
    "let l:line.='%#StatusLineNC# ['. &filetype .'] %f '
    let l:line.='%#StatusLineNC#'
    return l:line
  endif

  " active
  if a:mode ==# 'active'
    "let l:line.='%6*%{statusline#gitInfo()}'
    "let l:line.='%{ChangeStatuslineColor()}'                  " Changing the statusline
    "let l:line.='%0* %{toupper(g:currentmode[mode()])}'      " Current mode
    let l:line.=' %{GetMode()} %*'
    let l:line.='%8* [%n]'                                   " Buffernr
    "let l:line.='%8* %{GitInfo()}'                           " Git Branch name
    let l:line.='%8* %<%F %{ReadOnly()} %m %w'           " File+path
    let l:line.='%#warningmsg#'
    "let l:line.='%{SyntasticStatuslineFlag()}'                " Syntastic Errors
    let l:line.='%*'
    let l:line.='%9* %='                                     " Space
    let l:line.='%8* %y'                                    " FileType
    let l:line.='%7* %{(&fenc!=""?&fenc:&enc)}[%{&ff}]'    " Encoding & Fileformat
    let l:line.='%8* %-3(%{FileSize()}%)'                    " File Size
    "let l:line.='%8* %3p %l: %3c'                    " Rownumber/total (%)

  elseif a:mode ==# 'lint'
    let l:line.='%3* Lint %*'
    let l:line.='%8* [%n]'                                   " Buffernr
    "let l:line.='%8* %{GitInfo()}'                           " Git Branch name
    let l:line.='%8* %<%F %{ReadOnly()} %m %w'           " File+path
    let l:line.='%#warningmsg#'
    "let l:line.='%{SyntasticStatuslineFlag()}'                " Syntastic Errors
    let l:line.='%*'
    let l:line.='%9* %='                                     " Space
    let l:line.='%8* %y'                                    " FileType
    let l:line.='%7* %{(&fenc!=""?&fenc:&enc)}[%{&ff}]'    " Encoding & Fileformat
    let l:line.='%8* %-3(%{FileSize()}%)'                    " File Size
   " let l:line.='%8* %3p%%  %l: %3c'                    " Rownumber/total (%)
  else
    " inactive
    let l:line.='%#StatusLineNC#'
    let l:line.='%f'
  endif

  let l:line.='%*'

  return l:line
endfunction
" DEFINE MODE DICTIONARY
let s:dictmode= {
      \ 'n': ['Normal', '6'],
      \ 'no': ['N-Operator Pending', '4'],
      \ 'v': ['Visual', '6'],
      \ 'V': ['V·Line', '6'],
      \ '': ['V·Block', '6'],
      \ 's': ['S.', '3'],
      \ 'S': ['S·Line', '3'],
      \ '': ['S·Block.', '3'],
      \ 'i': ['Insert', '5'],
      \ 'R': ['R.', '1'],
      \ 'Rv': ['V·Replace', '1'],
      \ 'c': ['Command', '2'],
      \ 'cv': ['Vim Ex', '7'],
      \ 'ce': ['Ex', '7'],
      \ 'r': ['Propmt', '7'],
      \ 'rm': ['More', '7'],
      \ 'r?': ['Confirm', '7'],
      \ '!': ['Sh', '2'],
      \ 't': ['T', '2']
      \ }

" Another way to change the color of the modeindicator together with GetMode()
" DEFINE COLORS FOR STATUSBAR
"let s:statusline_color=printf('highlight! StatusLine gui=NONE cterm=NONE guibg=NONE ctermbg=NONE guifg=%s ctermfg=%s','', 'NONE')
let s:statusline_color=printf('highlight! StatusLine ctermbg=%s', 'Cyan')
let s:dictstatuscolor={
      \ '1': s:statusline_color,
      \ '2': s:statusline_color,
      \ '3': s:statusline_color,
      \ '4': printf('highlight! StatusLine guifg=%s','#fe8019'),
      \ '5': printf('highlight! StatusLine ctermfg=004 guifg=%s','#fabd2f'),
      \ '6': printf('highlight! StatusLine guifg=%s','#8ec07c'),
      \ '7': s:statusline_color,
      \}


" GET CURRENT MODE FROM DICTIONARY AND RETURN IT
" IF MODE IS NOT IN DICTIONARY RETURN THE ABBREVIATION
" GetMode() GETS THE MODE FROM THE ARRAY THEN RETURNS THE NAME
function! GetMode() abort
  let l:modenow = mode()
  if has_key(s:dictmode, l:modenow)
    let l:modelist = get(s:dictmode, l:modenow, [l:modenow, '1'])
    let l:modecolor = l:modelist[1]
    let l:modehighlight = get(s:dictstatuscolor, l:modecolor, '1')
    exec l:modehighlight
    let l:modename = l:modelist[0]
    return l:modename
  endif
  return ''
endfunction



" }}}
" Unused Stuff {{{
" Toggle Vexplore with Ctrl-E
"function! ToggleVExplorer()
"  if exists("t:expl_buf_num") "global variable for current tap, since only one instance of explorer
"                              "per tab is preffered, replace t with w to change to window
"    let expl_win_num = bufwinnr(t:expl_buf_num)
"    if expl_win_num != -1
"      let cur_win_nr = winnr()
"      exec expl_win_num . 'wincmd w'
"      close
"      if expl_win_num > cur_win_nr
"        exec cur_win_nr . 'wincmd w'
"      elseif cur_win_nr==2
"        exec '1wincmd w'
"      else
"        exec cur_win_nr . 'wincmd w'
"      endif
"      unlet t:expl_buf_num
"    else
"      unlet t:expl_buf_num
"    endif
"  else
"    "exec '1wincmd w'
"    Vexplore
"    let t:expl_buf_num = bufnr("%")
"  endif
"endfunction
"map <silent> <C-E> :call ToggleVExplorer()<CR>
"let g:currentmode={
"    \ 'n'   :   'N ',
"    \ 'no'  :   'N·Operator Pending ',
"    \ 'v'   :   'V ',
"    \ 'V'   :   'V·Line ',
"    \ ''  :   'V·Block ',
"    \ 's'   :   'Select ',
"    \ 'S'   :   'S·Line ',
"    \ ''  :   'S·Block ',
"    \ 'i'   :   'I ',
"    \ 'R'   :   'R',
"    \ 'Rv'  :   'V·Replace',
"    \ 'c'   :   'Command ',
"    \ 'cv'  :   'Vim Ex ',
"    \ 'ce'  :   'Ex ',
"    \ 'r'   :   'Prompt ',
"    \ 'rm'  :   'More ',
"    \ 'r?'  :   'Confirm ',
"    \ '!'   :   'Shell ',
"    \ 't'   :   'Terminal '
"    \}
"
"" Automatically adjust statusline colors
"function! ChangeStatuslineColor()
"    if (mode() =~# '\v(n|no)')
"        exe 'hi! StatusLine ctermfg=008 guifg=#fe8019'
"    elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block ' || get(g:currentmode, mode(), '') ==# 't')
"        exe 'hi! StatusLine ctermfg=005 guifg=#8ec07c'
"    elseif (mode() ==# 'i')
"        exe 'hi! StatusLine ctermfg=004 guifg=#fabd2f'
"    else
"        exe 'hi! StatusLine ctermfg=006'
"    endif
"
"    return ''
"endfunction


" Replaced Powerline with Airline since it was pure vimscript instead of
" python
" Enable powerline using one of the two solutions bellow (should both work
" similarly. Top solution usually creates fewer errors on systems without
" powerline.
" set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup

" }}}
" Modelines
" vim:foldmethod=marker:foldlevel=0
