" Plugins {{{
let maplocalleader="+"  " vim-latex default bindings are all under localleader
" }}}


if has('gui_running')
  set background=dark
  colorscheme gruvbox-material
else
  colorscheme gruvbox-material
  set background=dark
    if has('terminal') && !(&term ==# 'xterm-kitty') && !(&term ==# 'xterm-256color')
        " Avoid setting this variable when it is not absolutely neccesary
        " since it is very very slow (10 times as long startuptime as
        " everything else combined)
        set term=xterm-256color " Falls back to 'xterm' if it does not start with xtert
    endif
endif


" vim:foldmethod=marker:foldlevel=0
