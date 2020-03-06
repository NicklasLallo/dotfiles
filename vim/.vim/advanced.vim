" Plugin settings {{{
    call deoplete#custom#var('omni', 'input_patterns', {
        \ 'tex': g:vimtex#re#deoplete
        \})
" Vim Fugitive {{{
" only allow dp & do while using fugitive to avoid any pauses while pressing d
" in other modes.
autocmd BufRead fugitive\:* xnoremap <buffer> dp :diffput<cr>|xnoremap <buffer> do :diffget<cr>

" Simply load fugitive non lazily for now.
call plug#load('vim-fugitive')
" call fugitive#detect(expand('%:p'))
" I had some problems with recursive LazyLoadFugitive calls.
" command! Gstatus call s:LazyLoadFugitive('Gstatus')
" command! Gdiff call s:LazyLoadFugitive('Gdiff')
" command! Glog call s:LazyLoadFugitive('Glog')
" command! Gblame call s:LazyLoadFugitive('Gblame')
" command! Gcd call s:LazyLoadFugitive('Gcd')

" function! s:LazyLoadFugitive(cmd)
"   call plug#load('vim-fugitive')
"   call fugitive#detect(expand('%:p'))
"   exe a:cmd
" endfunction
" }}}
" WhichKey {{{
call which_key#register(',', "g:which_key_map")
nnoremap <silent> <leader> :WhichKey ','<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual ','<CR>
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
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
let g:which_key_map['T'] = 'Toggle spellcheck'
let g:which_key_map['t'] = ':Tags Fuzzy search'
let g:which_key_map['w'] = 'Write / Save'
let g:which_key_map['i'] = 'Toggle Invisible'
let g:which_key_map['l'] = 'Go To last Tab'
let g:which_key_map['C'] = 'color test'
let g:which_key_map['f'] = 'Search/Replace cWord paragraph'
let g:which_key_map['%'] = 'Search/Replace cWord global'
let g:which_key_map['?'] = 'Google cWord'
let g:which_key_map['!'] = 'Google cWord FeelingLucky'


let g:which_key_map['C'] = 'Colorpicker'

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
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
if has('gui_running')
    let g:airline_right_sep = '' " kitty needs a space after any extra wide symbol to show it correctly, so this is the temporary solution until I feel like switchign terminal to something like alacritty.
endif
let g:airline_left_sep= ' ' " Seems to always be a space after the left sep
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_buffers = 0

" autocmd User AirlineAfterInit,AirlineAfterTheme call AirlineInit()

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

" Make fzf use the colors of the current vim colorscheme instead of any default
" colors used in the terminal colorscheme
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

if (executable('ag'))
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif

" Make fzf open a floating window by default
     " let $FZF_DEFAULT_OPTS = '--layout=reverse'

     " let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }

     function! OpenFloatingWin()
       let height = &lines - 3
       let width = float2nr(&columns - (&columns * 2 / 10))
       let col = float2nr((&columns - width) / 2)

       let opts = {
             \ 'relative': 'editor',
             \ 'row': height * 0.3,
             \ 'col': col + 30,
             \ 'width': width * 2 / 3,
             \ 'height': height / 2
             \ }

       let buf = nvim_create_buf(v:false, v:true)
       let win = nvim_open_win(buf, v:true, opts)

       call setwinvar(win, '&winhl', 'Normal:Pmenu')

       setlocal
             \ buftype=nofile
             \ nobuflisted
             \ bufhidden=hide
             \ nonumber
             \ norelativenumber
             \ signcolumn=no
     endfunction



" let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --color=always --exclude .git'
" let $FZF_DEFAULT_OPTS="--extended"
"let g:fzf_files_options = '--preview "(head -'.&lines.' | rougify {} || bat --color \"always\" --line-range 0:100 {} || head -'.&lines.' {})"'

function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

nnoremap <silent> <leader>a :call FZFOpen(':Ag')<CR>
nnoremap <silent> <leader>t :call FZFOpen(':Tags')<CR>

nnoremap <silent> <C-g>g :call FZFOpen(':Ag')<CR>
nnoremap <silent> <C-g>c :call FZFOpen(':Commands')<CR>
nnoremap <silent> <C-g>l :call FZFOpen(':BLines')<CR>

nnoremap <silent> <C-b> :call FZFOpen(':Buffers')<CR>
nnoremap <silent> <C-f> :call FZFOpen(':Files')<CR>
nnoremap <silent> <C-h> :call FZFOpen(':History')<CR>
" nnoremap <silent> <C-p> :call FZFOpen(':call Fzf_dev()')<CR>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
inoremap <c-l> <C-x><C-l>

nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>

command! FZFMru call fzf#run({
\  'source':  v:oldfiles,
\  'sink':    'e',
\  'options': '-m -x +s',
\  'down':    '40%'})

command! -bang -nargs=* Find call fzf#vim#grep(
    \ 'rg --column --line-number --no-heading --follow --color=always '.<q-args>, 1,
    \ <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)
command! -bang -nargs=? -complete=dir GitFiles
    \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)



" Use FZF for spellchecking instead of the default full screen thingy.
" overrides the normal mode command: z=
" optionally spellsuggest can take more arguments, 2nd is for number of
" suggestions
function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction

function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
endfunction
nnoremap z= :call FzfSpell()<CR>

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
" Creates the directories if they don't exist
if !isdirectory($HOME . "/.vim/tmp")
    call mkdir($HOME . "/.vim/tmp", "p")
endif
if !isdirectory($HOME . "/.vim/undodir")
    call mkdir($HOME . "/.vim/undodir", "p")
endif
if !isdirectory($HOME . "/.vim/dictionary")
    call mkdir($HOME . "/.vim/dictionary", "p")
endif
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.
set dictionary=~/.vim/dictionary

if has("persistent_undo")
    set undodir=~/.vim/undodir,~/.undodir/
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
    " nmap <F2> :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-c>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    " nmap <F3> :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-c>d :cs find d <C-R>=expand("<cword>")<CR><CR>
    nmap <C-c>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    " nmap <F4> :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-c>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-c>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-c>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-c>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-c>a :cs find a <C-R>=expand("<cfile>")<CR><CR>

    " tags navigation
    " Go to definition (requires Ctags)
    " nnoremap <C-d> <C-]>

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
" Cscope (with fzf) {{{

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

" After loading into quickfix navigate the  using
nnoremap <Leader>j :cnext<CR>
nnoremap <Leader>k :cprevious<CR>

" }}}
" ALE {{{

" use nice symbols for errors and warnings
let g:ale_sign_error = '✗\ '
let g:ale_sign_warning = '⚠\ '

" }}}
" Wilder {{{
" if has('nvim')
"     call wilder#enable_cmdline_enter()
"     cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
"     cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"
"     set wildcharm=<Tab>

"     let s:status_hl = wilder#make_hl('WilderStatus', 'WildStatus')
"     let s:mode_hl   = wilder#make_hl('WilderMode', 'WildMode')
"     let s:index_hl  = wilder#make_hl('WilderIndex', 'airline_z')
"     let s:sep_hl    = wilder#make_hl('WilderSep', 'WilderSeparator')

"     " call wilder#set_option('pipeline', [
"     "             \   wilder#branch(
"     "             \     [
"     "             \       wilder#check({_, x -> empty(x)}),
"     "             \       wilder#history(10),
"     "             \     ],
"     "             \     wilder#cmdline_pipeline(),
"     "             \     [
"     "             \       wilder#python_fuzzy_delimiter(),
"     "             \       wilder#python_search({'engine': 're'}),
"     "             \       wilder#result_output_escape('^$,*~[]/\'),
"     "             \     ],
"     "             \   ),
"     "             \ ])

"     call wilder#set_option('renderer', wilder#statusline_renderer({
"                 \ 'separator':' • ',
"                 \ 'separator_hl': s:sep_hl,
"                 \ 'hl': s:status_hl,
"                 \ 'left': [
"                 \    {'value': [{-> getcmdtype() ==# ':' ? ' Command ' : ' Search '}, wilder#spinner()], 'hl': s:mode_hl},
"                 \    wilder#separator('', s:mode_hl, s:status_hl, 'left'), ' ',
"                 \ ],
"                 \ 'right': [
"                 \    ' ', wilder#separator('', s:index_hl, s:status_hl, 'right'),
"                 \    wilder#index({'hl': s:index_hl}),
"                 \ ],
"                 \ }))

"     " Enable cmdline completion (for Neovim only)
"     call wilder#set_option('modes', ['/', '?', ':'])
" endif
" }}}
" Other {{{
    " Visual {{{
    let g:highlightedyank_highlight_duration = 100
    if !exists('##TextYankPost')
        map y <Plug>(highlightedyank)
    endif

    let g:highlightedundo#highlight_mode = 2
    " let g:highlightedundo#highlight_duration_delete = 100
    " let g:highlightedundo#highlight_duration_add = 100
    nmap g-    <Plug>(highlightedundo-gminus)
    nmap g+    <Plug>(highlightedundo-gplus)

    " highlightedundo and vim-repeat both remap the u, U, and <C-R> keys.
    " I use a personal fork of vim-repeat that adds repeat#wrapMod to fix that
    nnoremap <silent> u     :<C-U>call repeat#wrapMod("\<Plug>(highlightedundo-undo)",v:count)<CR>
    nnoremap <silent> U     :<C-U>call repeat#wrapMod("\<Plug>(highlightedundo-Undo)",v:count)<CR>
    nnoremap <silent> <C-R> :<C-U>call repeat#wrapMod("\<Plug>(highlightedundo-redo)",v:count)<CR>

    IndentLinesEnable " Display a small line with each indentationlevel

    " vim-signify
    let g:signify_vcs_list = ['git']
    let g:signify_skip_filetype = { 'journal': 1 }
    let g:signify_sign_delete        = '-' " - is the opposite of +, not sure why _ is default
    " let g:signify_sign_add          = '│'
    " let g:signify_sign_change       = '│'
    " let g:signify_sign_changedelete = '│'

    " To make shiny and yankstack work together I have a modified fork of
    " shiny that allows for a custom command.
    nnoremap <silent> p :call shiny#custom("\<Plug>(Paste_p)")<CR>
    nnoremap <silent> P :call shiny#custom("\<Plug>(Paste_P)")<CR>
    nnoremap <silent> ]p :call shiny#custom("\<Plug>(PasteIndent_p)")<CR>
    nnoremap <silent> [P :call shiny#custom("\<Plug>(PasteIndent_P)")<CR>
    nnoremap <silent> <M-p> :call shiny#custom("\<Plug>(SwapPasteNext)")<CR>
    nnoremap <silent> <M-P> :call shiny#custom("\<Plug>(SwapPastePrevious)")<CR>
    nmap gp <Plug>(shiny-gp)
    nmap gP <Plug>(shiny-gP)

    let g:vim_shiny_window_change = 1 " The background flashes briefly when changing windows <M-j> <M-k>

    augroup plugin-vim-shiny
        autocmd WinEnter * call shiny#window#flash()
    augroup END
    " }}}

" vim-ipython tmux integration
let g:cellmode_tmux_sessionname=''  " Will try to automatically pickup tmux session
let g:cellmode_tmux_windowname=''
let g:cellmode_tmux_panenumber='2'
let g:cellmode_default_mappings='0'
vmap <silent> <C-c> :call RunTmuxPythonChunk()<CR>
" noremap <silent> <C-b> :call RunTmuxPythonCell(0)<CR>
noremap <silent> <C-g> :call RunTmuxPythonCell(1)<CR>
" let g:cellmode_screen_sessionname='ipython'
" let g:cellmode_screen_window='0'

let g:no_plugins = 'false'
" Multi cursor
let g:multi_cursor_prev_key = '<C-S-n>'
" Only return from visual to normal
let g:multi_cursor_exit_from_visual_mode = 0
" Only return from insert to normal
let g:multi_cursor_exit_from_insert_mode = 0
nnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>
vnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>
"
"

" Disable the default <leader><leader> maps
let g:EasyMotion_do_mapping = 0
" The - key is my easymotion key.
map _ <Plug>(easymotion-s)
nmap - <Plug>(easymotion-sn)
xmap - <Esc><Plug>(easymotion-sn)\v%V
omap - <Plug>(easymotion-tn)
nnoremap g- -



" Disable IndentLine in json files (or change the default syntax file for json
" to not use 'conceal' on quotation marks
autocmd Filetype json :IndentLinesDisable
"}}}
" }}}
" Keybindings {{{
" F-keys {{{

" Automate things with :call VimuxRunCommand("shell command")

" By default F1 is for help. But :help does the same thing so.
nmap <F1> :call <SID>Runfile()<CR>:echo "Ran file in tmux split"<CR>
nmap <F2> :cs find s <C-R>=expand("<cword>")<CR><CR>:echo "Find C symbol"<CR>
nmap <F3> :cs find g <C-R>=expand("<cword>")<CR><CR>:echo "Find function definition"<CR>
nmap <F4> :cs find c <C-R>=expand("<cword>")<CR><CR>:echo "Find function calls"<CR>
" 5-8 are defined in init.vim
nmap <F9> :call plug#load('fzf.vim') \| Vista finder<CR>
nmap <silent> <leader><leader> :Vista focus<CR>

function! s:Runfile()
  " save file to disk
  update
  if &filetype ==# 'python'
    call VimuxRunCommand("clear; python3 " . bufname("%"))
    "TODO add support for more filetypes when needed
  endif
endfunction

" }}}

nnoremap <silent> <leader>i :call ToggleCC()<CR>

" Replaced gundo with UndoTree, pure vimscript instead of dependencies
nnoremap <leader>u :UndotreeToggle<CR>

" toggle NERDTree
nnoremap <silent> <Leader>nt :NERDTreeToggle<CR>
" not necessarily NTree related but uses NERDTree because I have it setup
nnoremap <leader>nd :e %:h<CR>


" These work similarly to C-N in visual-multi, use whichever one you prefer
" Here you do a change once completely for the first match, and then just
" press the . command to repeatedly change the others.

" make current word pattern, then search select and change it
" use . to then change the next occurance of the same word to the same thing
nnoremap <silent> c* *Ncgn
" Same but backwards
nnoremap <silent> c# #NcgN
" make current word pattern, then search select and append to it
" looks complicated but it's just to make it repeatable with vim-repeat
nnoremap <silent> <Plug>AppendTextNext gn<esc>".p:call repeat#set("\<Plug>AppendTextNext")<CR>
nnoremap <silent> <Plug>AppendText *Ncgn<C-r>"<C-o>:call repeat#set("\<Plug>AppendTextNext")<CR>
nmap <silent> c>* <Plug>AppendText
" make current word pattern, then search select and prepend to it
nnoremap <silent> <Plug>PrependTextNext n".P:call repeat#set("\<Plug>PrependTextNext")<CR>
nnoremap <silent> <Plug>PrependText *Ncgn<C-r>"<C-o>`[<C-o>:call repeat#set("\<Plug>PrependTextNext")<CR>
nmap <silent> c<* <Plug>PrependText
" append & prepend backwards can be implemented in the same way but I wouldn't
" use them really.

" }}}
" vnoremap {{{

" vnoremap <C-k> :m-2<CR>gv
" vnoremap <C-j> :m '>+<CR>gv
" Schlepp moves lines around
vmap <C-j>    <Plug>SchleppUp
vmap <C-k>    <Plug>SchleppDown
vmap <C-h>    <Plug>SchleppLeft
vmap <C-l>    <Plug>SchleppRight

vmap <up>     <Plug>SchleppUp
vmap <down>   <Plug>SchleppDown
vmap <left>   <Plug>SchleppLeft
vmap <right>  <Plug>SchleppRight

vmap <S-up>   <Plug>SchleppIndentUp
vmap <S-down> <Plug>SchleppIndentDown

" }}}
" inoremap {{{

" }}}
" cnoremap {{{
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
" Modelines
" vim:foldmethod=marker:foldlevel=0
