" Pluggins {{{
execute pathogen#infect()
" Current List of Plugins
" Various Colorschemes:
" Gruvbox
" Others:
" Gundo (super undo tree)
" Vim-Surround
" Powerline

" }}}
"Intro Settings {{{
if version > 600
  filetype plugin indent on
endif


set laststatus=2 "always show the powerline statusbar in all windows
set showtabline=2 "always display the tabline, even if there is only one tab

" Enable powerline using one of the two solutions bellow (should both work
" similarly. Top solution usually creates fewer errors on systems without
" powerline.
set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup

if has('gui_running')
  set background=dark
else
  set background=dark
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

:match ExtraWhitespace /[^\t]\zs\t\+/    "Show tabs that are not at the start of a line
" :match ExtraWhitespace /\s\+$\| \+\ze\t/ "Show trailing whitespace and space before a tab

" Except when typing that line:
:match ExtraWhitespace /\s\+\%#\@<!$\| \+\ze\t/
":autocmd InsertLeave * redraw!
":match "Switch off :match highlighting.

" to avoid screen flashing use this
":au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
":au InsertLeave * match ExtraWhitespace /\s\+$/

" apply highlighting in all windows and not only current
":autocmd BufWinEnter * match ExtraWhitespace /^\s* \s*\|\s\+$/
autocmd BufWinLeave * call clearmatches()

"Another way to find trailing whitespace, I toggle in lintmode
"set list                " needed for listchars
set listchars=tab:>-,trail:.,extends:#,nbsp:~

colorscheme gruvbox

let mapleader=","       " leader is comma instead of \
" }}}
" Basic Settings {{{

syntax enable           " enables syntax highlighting
set noshowmode "Hide the default mode text (e.g. -- INSERT -- below the statusline)
set nobackup            " most files are in git anyways
set encoding=utf-8      " usually the case rather than latin1
set textwidth=0         " disable automatic word wrapping (newlines)
set hidden              " preserve buffers by hiding instead of closing them
set showtabline=4       " t
set tabstop=4           " number of visual spaces per tab
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=4        " number of spaces used for autoindent, command: <<, >>, == (auto entire doc: gg=G)
set expandtab           " tabs are converted into spaces
set shiftround          " use multiples of shiftwidth when indenting with '<' and '>'
set number              " show line numbers
set relativenumber      " line numbers are relative to cursor position
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
"set lazyredraw          " redraw less often
set showmatch           " highlight matching {[()]}
set incsearch           " display search results while writing
set hlsearch            " high light search results
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase, otherwise case-sensitive
set wrapscan            " wrap the searches around the document (/ ?)
set ttyfast             " faster redraws
set history=1000        " save a much longer history (default 50) of commands and searches
set undolevels=1000     " save more levels of undo
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" set foldcolumn=1
set mouse=a             " enable mouse
set scrolloff=9         " center coursor
set nocp                " 'compatible' is not set
set autochdir       " Change directory to the current buffer when opening files.
set background=dark
set foldmethod=indent   " fold based on indent level alternatives are: marker, manual, expr, syntax, diff, run :help foldmethod for info
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.class
set title               " change the title of the terminal
"set visualbell          " don't beep
set noerrorbells        " don't beep
set clipboard=unnamed   " Copy & Paste with the system clipboard (the * register), no need to use the "* prefix when pasting or copying
set modelines=1         " user last line of file for modelines
set autoread            " automatically reread the file if it was changed from the outside without asking first
set wrap                " wrap lines
set autoindent
set smartindent

if exists('&guioptions')
    " cursor behaviour:
    " - no blinking in normal/visual mode
    " - blinking in insert-mode
    " set guicursor+=n-v-c:blinkon0,i-ci:ver25-Cursor/lCursor-blinkwait300-blinkoff500-blinkon500
endif

" }}}
" Keybindings {{{
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

" Toggle gundo, super undo
if exists('loaded_gundo')
    nnoremap <leader>u :GundoToggle<CR>
endif
if exists('g:loaded_surround')
endif
" open a new tab in the current buffer's path
" very useful when editing files in the same directory
" TODO combine with Vexplore and make more convinent
nnoremap <leader>e :tabedit <c-r>=expand("%:p:h")<CR>/<CR>

" allows jk to function like esc while in insert mode, if you ever need to write jk then wait a few sec between the letters
inoremap jk <esc>

" Visual Mode pressing * or # searches for the current selection
" Very useful for finding all occurances of something
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

" }}}
" Functions {{{
" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num") "global variable for current tap, since only one instance of explorer per tab is preffered, replace t with w to change to window
    let expl_win_num = bufwinnr(t:expl_buf_num)
    if expl_win_num != -1
      let cur_win_nr = winnr()
      exec expl_win_num . 'wincmd w'
      close
      if expl_win_num > cur_win_nr
        exec cur_win_nr . 'wincmd w'
      elseif cur_win_nr==2
        exec '1wincmd w'
      else
        exec cur_win_nr . 'wincmd w'
      endif
      unlet t:expl_buf_num
    else
      unlet t:expl_buf_num
    endif
  else
    "exec '1wincmd w'
    Vexplore
    let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

" Visual Selection tool
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

" Toggle 'Lint mode' where some additional checks are displayed such as trailing whitespaces and 100 char limit
" Toggle with leader+l
function! ToggleCC()
  if exists("t:ccline")
    unlet t:ccline
    set colorcolumn=100
    setl statusline=%!StatusLine('lint')
    set list
  else
    let t:ccline = winnr()
    set colorcolumn=0
    setl statusline=%!StatusLine('active')
    set list!
    redraw!
  endif
endfuncti

" }}}
" Let {{{
" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4  " open new files in previous window (no new splits)
let g:netrw_altv = 1          "
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



if exists ('loaded_powerline')

else
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



" }}}
" Modelines
" vim:foldmethod=marker:foldlevel=0
