execute pathogen#infect()
syntax enable "enables syntax processing
filetype plugin indent on

set laststatus=2 "always show the powerline statusbar in all windows
set showtabline=2 "always display the tabline, even if there is only one tab
set noshowmode "Hide the default mode text (e.g. -- INSERT -- below the statusline)
set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

 if has('gui_running')
    set background=light
 else
     set background=dark
 endif

" set t_Co=256            " forces 256 colors so I don't have to change $TERM

colorscheme gruvbox

" makes the background disapear (so that it uses default terminal color and transparency)
" hi Normal ctermbg=NONE

set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces used for autoindent, command: <<, >>, == (auto entire doc: gg=G )
set expandtab       " tabs are converted into spaces
set number          " show line numbers
set relativenumber  " show relative distances to make commands such as 8dd faster. Abslut number is still shown on curor line
set showcmd         " show command in bottom bar
set cursorline      " highlight current line
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw only when we need to
set showmatch       " Highlight matching {[()]} probably enabled by deffault as well
set incsearch       " search as characters are entered
set hlsearch        " highlight matches

" turn of search highlight
nnoremap <leader><space> :nohlsearch<CR>

set ttyfast             " send more characters for redraws
set mouse=a             " enable mouse

" set this t othe name of your terminal that supports mouse codes.
" must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
" use only if problems without it arise
" set ttymouse=xterm2

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max

" space open/closes folds
nnoremap <space> za

set foldmethod=indent   " fold based on indent level alternatives are: marker, manual, expr, syntax, diff, run :help foldmethod for info
nnoremap gV `[v`]

let mapleader=","       " leader is comma, \ is inconvinient on a swedish keyboard


