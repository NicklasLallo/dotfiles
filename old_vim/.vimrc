" Install vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

source ~/.vim/init.vim      " Simple in editor settings. Nothing plugin related, no dependencies.
source ~/.vim/extra.vim     " More advanced/cluttered editor settings. No dependencies.

call plug#begin('~/.vim/plugged')
    source ~/.vim/plugBase.vim      " All plugins needed for base
    source ~/.vim/plugAdvanced.vim  " All plugins needed for advanced
call plug#end()

source ~/.vim/base.vim      " Most basic necessary quality of life plugins and their settings.
source ~/.vim/minimal.vim   " Some but minimal dependencies (at least vim7 (2006) or newer or such).
source ~/.vim/advanced.vim  " Could/will have all other mixed dependencies (Python, fzf, tags, etc)
source ~/.vim/functions.vim " Vimscript, should have no dependencies
if has('nvim')
    source ~/.vim/nvim.vim  " Reqires Neovim
endif
" vim:foldmethod=marker:foldlevel=0
