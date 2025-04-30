# Sometimes less is more.
# This is a single-file simple zsh configuration. Without any frameworks like oh-my-zsh or prezto.

autoload -Uz compinit && compinit

# Requirements (all available via brew):
# - brew install fzf
# - brew install forgit
# - brew install starship
# - brew install eza
# Follow up command:
# `starship preset gruvbox-rainbow -o ~/.config/starship.toml`
# Additonally, install some font. I like Iosevka Nerd Font.

alias vim="nvim"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias :q="exit"
alias :Q="exit"
alias :wq="exit"
alias gs="git status"
alias gc="git commit"
alias gcm="git commit -m"
alias gco="git checkout"
alias gl="git pull"
alias gp="git push"
alias lg="lazygit" #see https://github.com/jesseduffield/lazygit
alias l="ls -lah"
alias cdd="cd ~/dotfiles/"

# Add fzf key bindings:
# - CTRL-T - Paste the selected file path(s) into the command line
# - CTRL-R - Paste the selected command from history into the command line
# - ALT-C - cd into the selected directory
# - COMMAND [DIRECTORY/][FUZZY_PATTERN]**<TAB>
# The above uses the fzf finder to select a file or directory (example: nvim **<TAB>)
# It also works with: git, ssh, kill -9, export, telnet, and more.
eval "$(fzf --zsh)"

# Add fzf-cd-widget key binding.
# Only required on macOS, due to Alt/option being used for special characters.
# Worth noting, Esc+C also triggers the fzf-cd-widget. As does, of course:
# cd **<TAB>
bindkey "ç" fzf-cd-widget

# Add forgit plugin. Requires fzf.
# forgit adds the following aliases:
# - Interactive git add selector (ga)
# - Interactive git log viewer (glo)
# - Interactive .gitignore generator (gi)
# - Interactive git diff viewer (gd)
# - Interactive git reset HEAD <file> selector (grh)
# - Interactive git checkout <file> selector (gcf)
# - Interactive git checkout <branch> selector (gcb)
# - Interactive git branch -D <branch> selector (gbd)
# - Interactive git checkout <tag> selector (gct)
# - Interactive git checkout <commit> selector (gco)
# - Interactive git revert <commit> selector (grc)
# - Interactive git stash viewer (gss)
# - Interactive git stash push selector (gsp)
# - Interactive git clean selector (gclean)
# - Interactive git cherry-pick selector (gcp)
# - Interactive git rebase -i selector (grb)
# - Interactive git blame selector (gbl)
# - Interactive git commit --fixup && git rebase -i --autosquash selector (gfu)
[ -f $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh ] && source $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh


# The following will expand all aliases so it's easier to read the history, and for anyone watching.
globalias() {
   zle _expand_alias
   zle expand-word
   zle self-insert
}
zle -N globalias

globalias-return() {
   zle _expand_alias
   zle accept-line
}
zle -N globalias-return

# space expands all aliases, including global
bindkey -M emacs " " globalias
bindkey -M viins " " globalias

# Enter expands all aliases and accepts the line
bindkey -M emacs "^M" globalias-return

# control-space to make a normal space
bindkey -M emacs "^ " magic-space
bindkey -M viins "^ " magic-space

# normal space during searches
bindkey -M isearch " " magic-space

# enable the built in completion features (tab completion)
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
# zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# enables shift+tab to cycle the completion menu backwards
zmodload zsh/complist
bindkey -M menuselect '^[[Z' reverse-menu-complete
# Optionally, just use:
# bindkey '^[[Z' reverse-menu-complete

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}

# Easy way to extract archives
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1;;
           *.tar.gz)    tar xvzf $1;;
           *.bz2)       bunzip2 $1 ;;
           *.rar)       unrar x $1 ;;
           *.gz)        gunzip $1  ;;
           *.tar)       tar xvf $1 ;;
           *.tbz2)      tar xvjf $1;;
           *.tgz)       tar xvzf $1;;
           *.zip)       unzip $1   ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1;;
           *) echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

# if eza is installed add some aliases:
# if hash eza &> /dev/null; then
if (( $+commands[eza] )); then
    # general use
    alias ls='eza'                                                         # ls
    alias l='eza -lbF --git'                                               # list, size, type, git
    alias ll='eza -lbGF --git'                                             # long list - grid drisplay
    alias llm='eza -lbGF --git --sort=modified'                            # long list, modified date sort
    alias la='eza -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
    alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list

    # speciality views
    alias lS='eza -1'			                                                  # one column, just names
    alias lt='eza --tree --level=2'                                         # tree
    alias lso='/bin/ls' # "ls origigal"  - use the system ls
fi

# Use starship prompt
eval "$(starship init zsh)"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Created by `pipx` on 2025-01-14 11:21:43
export PATH="$PATH:/Users/NLALLO/.local/bin"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

export PATH="/usr/local/libexec/:$PATH"
