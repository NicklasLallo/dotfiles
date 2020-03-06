 " Basic Settings {{{
let mapleader=","     " leader is comma instead of \
syntax enable         " enables syntax highlighting
set guioptions=
" Always increment as base 10 (<C-a> & <C-x>)
set nrformats=
set termguicolors     " Doesn't work with all terminals but fixes a few colorschemes for the terminals that support it
"set shell="/bin/zsh" " There are better places to fix this
"set shellredir=">%s 2>&1"
"set shellpipe="2>&1| tee"
set backspace=indent,eol,start " make backspace behave as expected
set display+=lastline " avoid '@@@' filler, default in nvim but not in older regular vim
set guioptions=       " Always increment as base 10 (<C-a> & <C-x>)
set nobackup          " most files are in git anyways
set autoread          " Alway reload buffer when external changes detected
set encoding=utf-8    " usually the case rather than latin1
set textwidth=0       " disable automatic word wrapping (newlines)
set hidden            " preserve buffers by hiding instead of closing them
set showtabline=2     " always
set fileformats=unix,mac,dos " Handle various end-of-line formats
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
" set wildmode=list:longest,full " configure wildmenu
"set lazyredraw          " redraw less often
set showmatch         " highlight matching {[()]}
set incsearch         " display search results while writing
set hlsearch          " high light search results
set ignorecase        " ignore case when searching
set infercase         " smart case when using insert mode completion (:h ins-completion)
set smartcase         " ignore case if search pattern is all lowercase, otherwise case-sensitive
set wrapscan          " wrap the searches around the document (/ ?)
set timeoutlen=500    " fast fingers with multi key mappings, (default 1000)
set ttyfast           " faster redraws
set history=1000      " save a much longer history (default 50) of commands and searches
set undolevels=1000   " save more levels of undo
set foldenable        " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10    " 10 nested fold max
set foldmethod=indent " fold similar indentation levels
set iskeyword+=-      " Treat dash separated words as word text objects (for ciw etc)
" set foldcolumn=1
set mouse=a           " enable mouse
set scrolloff=9       " center coursor
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
set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m
let g:GVI_use_ag = 1
set smartindent
set noshowmode        " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set formatoptions+=1  " Make pasting big things slightly smarter
set virtualedit=block " Visual block will always be square shaped even if some lines are shorter

if has('patch-7.3.541')
  set formatoptions+=j
endif

if has('patch-7.4.338')
  let &showbreak = '↳ '  " Distinguish wrapped lines slightly easier
  set breakindent        " retain indent
  set breakindentopt=sbr " Show the symbol
endif
" }}}
" Various {{{
if version > 600
  filetype plugin indent on
endif
" Allows the :Man command to open manpages for software, ex: :Man grep
runtime ftplugin/man.vim
set laststatus=2 "always show the powerline statusbar in all windows
set showtabline=2 "always display the tabline, even if there is only one tab

" automatically resize windows when vim is resized
autocmd VimResized * wincmd =

" (uBB is right double angle, uB7 is middle dot)
set listchars=tab:»·,trail:␣,nbsp:˷

autocmd FileType markdown setlocal spell
autocmd FileType markdown setlocal complete+=kspell

autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit setlocal complete+=kspell

autocmd FileType tex setlocal spell
autocmd FileType tex setlocal complete+=kspell
" go to next spelling misstake, pick first correction ( 1z= ), then jump back.
" should be undoable (<c-g>u)
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Make vim start with a client-server setup if possible:
if empty(v:servername) && exists('*remote_startserver')
    call remote_startserver('VIM')
endif"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce (not to mention that libvte based terminals
" incorrectly contain bce in their terminfo files). This causes
" incorrect background rendering when using a color theme with a
" background color. (Kitty, tmux).
" This makes it not use the term color for clearing/erase
let &t_ut=''
" }}}
" Keybindings {{{

map <F5> :mksession! ~/.vim_session<cr>
map <F6> :source ~/.vim_session<cr>
nnoremap <silent> <F7> :call <SID>rotate_colors()<cr>
nnoremap <silent> <F8> :call <SID>light_colors()<cr>

" nnoremap {{{
" q: is more annoying than useful
" nnoremap q: :
" Extend previous match with new search
nnoremap //   /<C-R>/
nnoremap ///  /<C-R>/\<BAR>
" <tab> is by default the same as <C-I> (opposite of <C-O>).
" I don't need double shortcuts for that.
" Some terminals can't send <tab> but always send <C-I> in which
" case this shouldn't do anything at all.
" nnoremap <tab> %
" vnoremap <tab> %
" space open/closes folds
nnoremap <space> za
" visualy select last inserted text
nnoremap gV `[V`]
" Yank to end of line (default Y=yy)
" Makes yank behave the same as D
nnoremap Y y$
" edit this file
nnoremap <silent> <leader>ev :tabedit ~/.vimrc<CR>
" source this file after edits
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>
" edit the .zshrc file
nnoremap <silent> <leader>ec :tabedit ~/.zshrc<CR>
" `gf` opens file under cursor in new vertical split
nnoremap gf :vertical wincmd f<CR>
" move visual lines instead of real lines, less confusing together with wraping lines
" j&k still work like normal when preceeded with a count, and any movement larger than 5 goes to the jumplist.
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Scroll faster.
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>


" Faster way to open search since it's used to often
nmap ; :%s//g<LEFT><LEFT>
xmap ; :s//g<LEFT><LEFT>
" Super Save, save all windows as a session, reopen with vim -S (vim/gvim/nvim -S)
nnoremap <leader>s :mksession<CR>
" Fast Saving
nnoremap <leader>w :w!<CR>
" Toggle spell checking
nnoremap <silent> <leader>T :setlocal spell!<CR>
" Fast tab switching (Leader+Last)
let g:lasttab = 1
nnoremap <silent> <leader>l :exe "tabn ".g:lasttab<CR>
autocmd TabLeave * let g:lasttab = tabpagenr()

" Quick Search/Replace
nnoremap <leader>f :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <leader>% :%s/\<<C-r>=expand('<cword>')<CR>\>/

" allows jk to function like esc while in insert mode, if you ever need to write jk then wait a few sec between the letters - Removed because it interfered with multipleCursors which was more useful
"inoremap jk <esc>

" Visual Block mode is far more useful that Visual mode (so swap the commands)...
nnoremap v <C-V>
nnoremap <C-V> v

xnoremap v <C-V>
xnoremap <C-V> v
" }}}
" vnoremap {{{
" no typo "u" when intending "y" in visual mode. "u" changed to "gu"
vnoremap u <nop>
vnoremap gu u

" Visual Mode pressing * or # searches for the current selection
" Very useful for finding all occurances of something
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap < <gv
vnoremap > >gv
" make the dot operator work on each line of visual selections
xnoremap . :norm.<CR>
" make visual selection dot-able
vnoremap . :norm. &lt;CR&lt;

"=====[ Make jump-selections work better in visual block mode ]=================

xnoremap <expr>  G   'G' . virtcol('.') . "\|"
xnoremap <expr>  }   '}' . virtcol('.') . "\|"
xnoremap <expr>  {   '{' . virtcol('.') . "\|"

" p & P are normaly the same in visual-mode
" This makes P paste without replacing the content of the register instead.
xnoremap <expr> P '"_d"'.v:register.'P'

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

inoremap <c-a> <home>
inoremap <c-e> <end>

" inoremap ,, <C-x><C-o><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>" : ",,"<CR>
" inoremap ,; <C-n><C-r>=pumvisible()      ? "\<lt>Down>\<lt>C-p>\<lt>Down>" : ",;"<CR>
" inoremap ,: <C-x><C-f><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>" : ",:"<CR>
" inoremap ,= <C-x><C-l><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>" : ",="<CR>
" }}}
" cnoremap {{{
" allows incsearch highlighting for range commands
cnoremap $t <CR>:t''<CR>
" Example usecase: /regex$m  will move the next line matching regex to cursor pos
" cnoremap $T <CR>:T''<CR>
cnoremap $m <CR>:m''<CR>
" cnoremap $M <CR>:M''<CR>
cnoremap $d <CR>:d<CR>``
" Example usecase: /regex$m  will move the next line matching regex to cursor pos


" }}}
" commands {{{
:command WQ wq
:command Wq wq
:command W w
:command Q q
" }}}



" vim:foldmethod=marker:foldlevel=0
