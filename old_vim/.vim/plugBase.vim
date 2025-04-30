" Color themes
Plug 'sainnhe/gruvbox-material'
Plug 'junegunn/seoul256.vim'
Plug 'dracula/vim', {'as': 'dracula'}

" Styling
Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }
autocmd! User indentLine doautocmd indentLine Syntax
let g:indentLine_concealcursor = '' " default inc, no conceal on curorline

" Visual Feedback
" visual feedback for f, F, t, T
Plug 'deris/vim-shot-f'
Plug 'junegunn/vim-peekaboo'            " Preview \" @ i<C-R>
" Gives visual feedback for patterns and ranges for Ex commands.
" And live preview for :substitute :smagic :snomagic
Plug 'markonm/traces.vim'




" vim:foldmethod=marker:foldlevel=0
