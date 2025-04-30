" Plug {{{

" Plugins are sorted by category
" {{{ colorthemes
" TODO, cleanup and remove more of those that I never use
Plug 'AlessandroYorba/Alduin'
Plug 'AlessandroYorba/Despacio'
Plug 'AlessandroYorba/Sierra'
Plug 'KKPMW/sacredforest-vim', {'as': 'sacredforest'}
Plug 'KabbAmine/yowish.vim', {'as': 'yowish'}
Plug 'Nequo/vim-allomancer', {'as': 'allomancer'}
" Plug 'Zabanaa/neuromancer.vim'
" Plug 'altercation/vim-colors-solarized'
Plug 'arcticicestudio/nord-vim'
Plug 'caksoylar/vim-mysticaltutor', {'as': 'mystical-tutor'}
Plug 'challenger-deep-theme/vim', {'as': 'challenger-deep'}
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'cocopon/iceberg.vim'
Plug 'crusoexia/vim-dream'
Plug 'dikiaap/minimalist'
Plug 'drewtempelmeyer/palenight.vim', {'as': 'palenight'}
Plug 'fcpg/vim-fahrenheit'
Plug 'jacoborus/tender.vim', {'as': 'tender'}
Plug 'nightsense/carbonized'
Plug 'nightsense/cosmic_latte'
Plug 'nightsense/seabird'
Plug 'nightsense/snow'
Plug 'nightsense/stellarized'
Plug 'patstockwell/vim-monokai-tasty', {'as': 'monokai-tasty'}
Plug 'rakr/vim-one'
Plug 'rakr/vim-two-firewatch', {'as': 'two-firewatch'}
Plug 'romainl/Apprentice'
Plug 'sonph/onehalf'
Plug 'srcery-colors/srcery-vim', {'as': 'srcery'}
" Plug 'tlhr/anderson.vim'
Plug 'tomasr/molokai'
" Plug 'tpope/vim-vividchalk', {'as': 'vividchalk'}
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'w0ng/vim-hybrid'
Plug 'yuttie/hydrangea-vim'
Plug 'hzchirs/vim-material'
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
Plug 'NewProggie/NewProggie-Color-Scheme'
" :VsdContrast cycles contrast :VsdOptions show options
Plug 'mg979/vim-studio-dark' " vsdark | tomorrow_eigthies | sand
Plug 'liuchengxu/space-vim-theme'
Plug 'sainnhe/archived-colors' " cryslominsa
" Plug 'neutaaaaan/iosvkem'

" More language syntax packs
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['latex'] " Not compatible with vim-tex

" wal for colors
Plug 'dylanaraps/wal'

" Make gvim-only colorschemes work better in terminal vim
" Shouldn't be needed as long as :set termguicolors works
" reenable if the terminal 'only' supports 256 colors rather than
" 16M/truecolor. Disabling this plugin when it's not needed speads up starttime.
" Plug 'godlygeek/csapprox'

" }}}
" Styling {{{

    Plug 'ryanoasis/vim-devicons'
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }
    autocmd! User indentLine doautocmd indentLine Syntax
    let g:indentLine_concealcursor = '' " default inc, no conceal on curorline
    if has('nvim')
        " A bit to buggy, test again in a few months
        " Plug 'gelguy/wilder.nvim',         { 'do': ':UpdateRemotePlugins' }
    endif
    " Plug 'liuchengxu/vim-clap' " <C-J> <C-K> to cycle list
"  }}}
" {{{ Visual feedback
    " See what's going on
    " Displays function signatures from completions in the command line.
    Plug 'Shougo/echodoc.vim'


    " Show what just got pasted, undoed, yanked
    Plug 'NicklasLallo/vim-shiny'
    Plug 'machakann/vim-highlightedyank'
    Plug 'machakann/vim-highlightedundo'

    " if v:version >= 703
    " Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
    " endif
    " Improved tagbar with LSP and async processing
    Plug 'liuchengxu/vista.vim'
        " How each level is indented and what to prepend.
        " This could make the display more compact or more spacious.
        " e.g., more compact: ["▸ ", ""]
        let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
        let g:vista_fzf_preview = ['right:50%']
        " Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
        let g:vista#renderer#enable_icon = 1

    " This combination bellow shows both all vim-marks as well as all git/vcs
    " changes in the left side bar.
    if v:version >= 703
    Plug 'mhinz/vim-signify'
    let g:signify_vcs_list = [ 'git' ]    " Improve performance. Add more later if needed.
    let g:signify_skip_filetype = { 'tmp': 1, 'bak': 1 }
    endif
    let g:SignatureMarkTextHLDynamic=1      " Allows for interaction with signify/gitgutter
    Plug 'kshenoy/vim-signature'            " displays marks on lefthand side


    " Make hlsearch bearable without having to type :nohl all the time
    Plug 'romainl/vim-cool'                 " Disable hlsearch when you are done searching

    " Which-key similar to spacemacs
    Plug 'liuchengxu/vim-which-key'
    Plug 'lilydjwg/colorizer'
" }}}
" {{{ Outside tools
    " Let vim interact with tmux
    " Automate things with :call VimuxRunCommand("shell command")
    Plug 'benmills/vimux'
    " This a vim plugin that enables MATLAB-style cell mode execution for python scripts in vim, assuming an ipython interpreter running in screen (or tmux).
    "    C-c sends the currently selected lines to tmux
    "    C-g sends the current cell to tmux
    "    C-b sends the current cell to tmux, moving to the next one
    Plug 'julienr/vim-cellmode'
    " Fix FocusGained/FocusLost in terminal vim together with tmux
    " And also fix autoread in terminal vim (otherwise only working in gvim)
    Plug 'tmux-plugins/vim-tmux-focus-events'

    " automatically handles the tag files
    " Requires ctags/universal-ctags
    let g:gutentags_exclude_filetypes = ['vim', 'tags']
    Plug 'ludovicchabant/vim-gutentags'
" }}}
" Language Specific {{{
    " Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " crazy python syntax
    Plug 'lervag/vimtex' " latex for vim
    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0
    Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'} " for VimPlug
    set conceallevel=2
    let g:tex_conceal='abdmg'
    " Go
    Plug 'fatih/vim-go'
    " Syntax Highlighting for i3 config file
    Plug 'PotatoesMaster/i3-vim-syntax'
    " Emmet for vim
    " Plug 'mattn/emmet-vim'
    " Use with <C-y>,
" }}}
" Snippets {{{
    Plug 'sirver/ultisnips'
    " let g:UltiSnipsExpandTrigger = '<tab>'
    " let g:UltiSnipsJumpForwardTrigger = '<tab>'
    " let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

    " This is to make ultisnips work well together with youcompleteme while
    " both use <tab>
    function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
        return "\<C-n>"
        else
        call UltiSnips#JumpForwards()
        if g:ulti_jump_forwards_res == 0
            return "\<TAB>"
        endif
        endif
    endif
    return ""
    endfunction

    function! g:UltiSnips_Reverse()
    call UltiSnips#JumpBackwards()
    if g:ulti_jump_backwards_res == 0
        return "\<C-P>"
    endif

    return ""
    endfunction


    if !exists("g:UltiSnipsJumpForwardTrigger")
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    endif

    if !exists("g:UltiSnipsJumpBackwardTrigger")
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
    endif

    au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
    au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

" }}}
" Other {{{
    Plug 'zirrostig/vim-schlepp'             " move visual selections around
    Plug 'google/vim-searchindex'            " prints 'At match #N out of M matches' after any search.
    " multifile find & replace
    Plug 'brooth/far.vim'
    " :Far foo bar **/*.c     This finds the pattern to replace
    " :Fardo                  This does the replacement
    " :Farundo                Undo in panic

    " allows opening files with syntax: vim fileName:lineNr
    Plug 'bogado/file-line'
    Plug 'tweekmonster/startuptime.vim'
    " transpose csv/tsv
    Plug 'salsifis/vim-transpose'
    " Nice opening screen
    Plug 'mhinz/vim-startify'

    let g:startify_commands = [
    \   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
    \   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
    \ ]

    let g:startify_bookmarks = [
        \ { 'c': '~/.vimrc' },
        \ { 'g': '~/dotfiles/.gitconfig' },
        \ { 'z': '~/.zshrc' }
    \ ]

    autocmd User Startified setlocal cursorline
    nmap <leader>st :Startify<cr>
    " Simple comment toggeling with :gcc (line) or gc (target of a motion)
    Plug 'tpope/vim-commentary'
    " Plug 'tpope/vim-surround'                " Vim-surround
    Plug 'machakann/vim-sandwich'            " Instead of surround, uses 'sa{motion/text object}{addtion}', ex saiw), sd{del} (delete), or sr{del}{add} (replace)
    Plug 'NicklasLallo/vim-repeat'           " Fork to support undo highlights as well
    Plug 'kreskij/Repeatable.vim', { 'on': 'Repeatable' }
    Plug 'rhysd/git-messenger.vim'           " <leader>gm or :GitMessenger
" }}}
" Additional commands, tools, and maps {{{
    Plug 'AndrewRadev/splitjoin.vim'         " gS (split) & gJ (join)
    Plug 'AndrewRadev/switch.vim'            " gs (switch, ex: true->false, '&&'->'||')
    Plug 'junegunn/goyo.vim'                " Distraction free writinga :Goyo
    Plug 'junegunn/limelight.vim'           " Use together with goyo, :Limelight
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
" }}}
" Motions, Movements & Text Objects {{{
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

    " Change how motions work
    " Is currently maped to '-' & '_'
    Plug 'easymotion/vim-easymotion'

    " Vim Indent Object, simple plugin that adds the 'i' text-object for current indentation level.
    " Example: vii, vai, vaI, viI
    " Plug 'michaeljsmith/vim-indent-object' " Replaced by vimscript in this file
"  }}}
" Advanced {{{
    " If you are going to use these plugins make sure to read their help files
    " first. On the other hand these are also some of the most awesome plugins.


    Plug 'tpope/vim-fugitive', { 'on': [] }  " git awesomeness
    Plug 'junegunn/gv.vim'                   " git commit browse, requires fugitive, :GV

    " Linter
    Plug 'w0rp/ale'
    " semantic-based completion
    " let g:ycm_key_detailed_diagnostics = '<leader>D'
    " Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
if has('nvim')
    Plug 'Shougo/deoplete.nvim'
    Plug 'Shougo/neco-syntax'             " Generic syntax completion
    Plug 'deoplete-plugins/deoplete-go'   " Go completion
    Plug 'deoplete-plugins/deoplete-jedi' " Python completion


endif

    " 'yankstack', cCxX'Del' black hole redirection, swap-&-paste, visual move
    " paste don't override default register, replace operator, duplicate operator,
    " interactive paste with fzf, and more
    let g:yanktools_main_key = 'x' " unfortunate sacrifice, synonym for dl or <del>
    nmap S s$
    " :help yanktools.txt
    " I didn't get used to it and am using vim-sandwitch on s now instead
    Plug 'mg979/vim-yanktools'   " M-p & M-P to cycle stack, ]y & [y cycle with preview

    " Real multiple cursors
    " Plug 'terryma/vim-multiple-cursors'
    " Better newer faster stronger
    " To run the tutorial:
    " vim -Nu path/to/visual-multi/tutorialrc
    let g:VM_leader = '+'
    Plug 'mg979/vim-visual-multi'
    " Use easily with <C-n>

    " PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
    " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    " Both options are optional. You don't have to install fzf in ~/.fzf
    " and you don't have to run install script if you use fzf only in Vim.
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'shell': '/bin/zsh' }
    Plug 'junegunn/fzf.vim'


" }}}
" Potentially unnecessary {{{
    Plug 'junegunn/vim-journal'             " poor mans Org-mode
    " align, ex: gaip#
    " This functionality is also in visual-multi
    Plug 'junegunn/vim-easy-align'
"  }}}
" }}}
" vim:foldmethod=marker:foldlevel=0
