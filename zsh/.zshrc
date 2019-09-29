# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# . $HOME/.z.sh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="spaceship-prompt/spaceship"

# Spaceship settings
#
local sepSymbol="❯"
SPACESHIP_CHAR_SYMBOL="%F{red}${sepSymbol}%F{magenta}${sepSymbol}%F{cyan}${sepSymbol}%f "

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(fzf-z git forgit z zsh-autosuggestions colored-man-pages command-not-found fancy-ctrl-z)
# dune-quotes included as well
# Most plugins are bundled in oh-my-zsh but these are manually downloaded into .oh-my-zsh/custom/plugins:
# fzf-z
# zsh-syntax-highlighting
# forgit - fzf+git! commands: ga (add), glo (log), gi (ignore create), gd (diff), grh (reset head), gcf (checkout), gss (stash view), gclean (clean). Hotkeys: Strl+S (sort), ? (toggle preview), Ctrl+R (toggle selection), Ctrl+k/j (selection move), alt+w (toggle preview wrap), alt+j/k (previe move)

# User configuration

setxkbmap -layout se

source $ZSH/oh-my-zsh.sh



# if [[ -r /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
#     source /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh
# fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

if [[ $TERM == 'rxvt-unicode-256color' ]]; then
    # Import colorscheme from 'wal'
    # (wal -r &) # Old Wal
    ## Import colorscheme from 'wal' asynchronously
    # &   # Run the process in the background.
    # ( ) # Hide shell job control messages.
    (cat ~/.cache/wal/sequences &)

    # Alternative (blocks terminal for 0-3ms)
    # cat ~/.cache/wal/sequences

    # To add support for TTYs this line can be optionally added.
    source ~/.cache/wal/colors-tty.sh
fi


if [[ $USER == 'la1' ]]; then
    showerthoughts=$(curl -s --connect-timeout 5 -A '/u/DrDoctor13' \
    'https://www.reddit.com/r/showerthoughts/top.json?sort=top&t=week&limit=100' | \
    python2.7 -c 'import sys, random, json; randnum = random.randint(0,99); response = json.load(sys.stdin)["data"]["children"][randnum]["data"]; print "\n\"" + response["title"] + "\""; print "    -" + response["author"] + "\n";')
    echo $showerthoughts | cowsay | lolcat
fi

# Internet man page / cheat cheet
# usage: how_in language question
# ex: how_in python list folders
# It basically searches stackoverflow for you. Only really useful for simple questions.
function how_in(){
    q="${@:2}"
    curl cht.sh/$1/${q// /+}
}

# Find out what is taking so much space on your drives
diskspace() { du -k --max-depth=1 "$@" | sort -nr | awk '
     BEGIN {
        split("KB,MB,GB,TB", Units, ",");
     }
     {
        u = 1;
        while ($1 >= 1024) {
           $1 = $1 / 1024;
           u += 1
        }
        $1 = sprintf("%.1f %s", $1, Units[u]);
        print $0;
     }
    '
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

#List people in a Twitch channel chat
function twitch_list() { curl -s "https://tmi.twitch.tv/group/user/$1/chatters" | less; }

#Tail all logs in /var/log
alias logs="find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"
#Expand current directory structure in tree form
alias treed="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
#List by file size in current directory
sbs() { du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"):    $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';}
#Show active ports
alias port='netstat -tulanp'
#Translator; requires Internet
#Usage: translate <phrase> <output-language>
#Example: translate "Bonjour! Ca va?" en
#See this for a list of language codes: http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
function translate(){ wget -U "Mozilla/5.0" -qO - "http://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=$2&dt=t&q=$(echo $1 | sed "s/[\"'<>]//g")" | sed "s/,,,0]],,.*//g" | awk -F'"' '{print $2, $6}'; }




alias fd='fdfind'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias vim='nvim'
alias nv='nvim'
alias :q='exit'
alias please='sudo'
alias kindly='sudo'
# alias f='fzf --height 50% --border --preview "pygmentize -g -O style=monokai {}"'
alias f='fzf --height 50% --border --preview "bat --color=always {}"'
alias vimf='vim $(fzf --height 50% --border --preview "bat {}")'

function ranger-run(){
    zle kill-whole-line
    BUFFER="ranger"
    zle accept-line
    zle reset-prompt
    # eval 'command ranger'
    # zle reset-prompt
}

zle      -N  ranger-run-widget ranger-run
bindkey '^E' ranger-run-widget

# Bind \eg to `git status`
function _git-status {
    zle kill-whole-line
    # zle -U "git status"
    BUFFER="git status"
    zle accept-line
}
zle -N _git-status
bindkey '\eg' _git-status

alias gs="git status"
alias gb="git branchs"
alias cdd="cd ~/dotfiles"

function f_widget {
    local file=$(fzf --height 50% --border --preview "bat {}")
    if [[ -n $file ]] then;
        zle kill-whole-line
        zle reset-prompt
        BUFFER="vim $file"
        zle accept-line
    fi
    zle reset-prompt
}
zle -N f_widget
bindkey '^F' f_widget


# fuzzy grep open via ag with line number
vg() {
  local file
  local line

  read -r file line <<<"$(ag --nobreak --noheading $@ | fzf -0 -1 | awk -F: '{print $1, $2}')"

  if [[ -n $file ]]
  then
     vim $file +$line
  fi
}

# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

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

cdscuts_list_echo() {
    # cat $1 | sed 's/#.*//g' | sed '/^\s*$/d'
    cat $1 | sed '/^\s*$/d'
    # Same as above but includes the comments for the search
}

cdscuts_glob_echo() {
    local user_filelist
    user_filelist=''
    if [ -r ~/.cdg_paths ]; then
        user_filelist=$(cdscuts_list_echo ~/.cdg_paths)
    fi
    echo -e "$user_filelist" | sed '/^\s*$/d'
}
# Setup cdg function
# cd to a bookmark, bookmarks are stored in ~./cdg_paths
# unalias cdb 2> /dev/null
cdb() {
   local dest_dir="$(cdscuts_glob_echo | fzf )"
   if [[ $dest_dir != '' ]]; then
       cd $(echo "$dest_dir" | sed 's/#.*//g')
   fi
}
# export cdb > /dev/null
# Add current directory to bookmarks
bm() {
    local curr_dir="${PWD} # $*"
    if ! grep -Fxq "$curr_dir" ~/.cdg_paths; then
        echo "$curr_dir" >> ~/.cdg_paths
    fi
}
alias bookmark='bm'

#An alternative to the cdb & bm above, but without fzf
##############################################################################
# mark/jump support + completion
# un/mark name : bookmark a directory or remove one (unmark)
# jump name : jump to directory
# marks : show all bookmarks
export MARKPATH=$HOME/.marks
function jump {
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark {
    rm -i $MARKPATH/$1
}
function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}
_completemarks() {
  local curw=${COMP_WORDS[COMP_CWORD]}
  local wordlist=$(find $MARKPATH -type l -printf "%f\n")
  COMPREPLY=($(compgen -W '${wordlist[@]}' -- "$curw"))
  return 0
}

# complete -F _completemarks jump unmark





# fshow - git commit browser (enter for show, ctrl-d for diff, ` toggles sort)
fshow() {
  local out shas sha q k
  while out=$(
      git log --graph --color=always \
          --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
      fzf --ansi --multi --no-sort --reverse --query="$q" \
          --print-query --expect=ctrl-d --toggle-sort=\`); do
    q=$(head -1 <<< "$out")
    k=$(head -2 <<< "$out" | tail -1)
    shas=$(sed '1,2d;s/^[^a-z0-9]*//;/^$/d' <<< "$out" | awk '{print $1}')
    [ -z "$shas" ] && continue
    if [ "$k" = ctrl-d ]; then
      git diff --color=always $shas | less -R
    else
      for sha in $shas; do
        git show --color=always $sha | less -R
      done
    fi
  done
}

# fzf Git commands.
# CTRL-G CTRL-F for files
# CTRL-G CTRL-B for branches
# CTRL-G CTRL-T for tags
# CTRL-G CTRL-R for remotes
# CTRL-G CTRL-H for commit hashes
# Will return non-zero status if the current directory is not managed by git
is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 50% "$@" --border
}

fzf_gf() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

fzf_gb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

fzf_gt() {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -'$LINES
}

fzf_gh() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | head -1 | xargs git show --color=always | head -'$LINES |
  grep -o "[a-f0-9]\{7,\}" | head -1
}

fzf_gr() {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" --remote={1} | head -200' |
  cut -d$'\t' -f1
}

join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-git-helper() {
  local c
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(fzf_g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
  done
}
bind-git-helper f b t r h
unset -f bind-git-helper




# if exa is installed add some aliases:
# if hash exa &> /dev/null; then
if (( $+commands[exa] )); then
    # general use
    alias ls='exa'                                                         # ls
    alias l='exa -lbF --git'                                               # list, size, type, git
    alias ll='exa -lbGF --git'                                             # long list
    alias llm='exa -lbGF --git --sort=modified'                            # long list, modified date sort
    alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
    alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list

    # speciality views
    alias lS='exa -1'			                                                  # one column, just names
    alias lt='exa --tree --level=2'                                         # tree
fi

# make git use diff-so-fancy if it's sourced:
if [[ -f $HOME/diff-so-fancy ]]; then
    git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
    git config --bool --global diff-so-fancy.markEmptyLines false
    git config --global color.ui true
    git config --global color.diff-highlight.oldNormal    "red bold"
    git config --global color.diff-highlight.oldHighlight "red bold 52"
    git config --global color.diff-highlight.newNormal    "green bold"
    git config --global color.diff-highlight.newHighlight "green bold 22"
    git config --global color.diff.meta       "11"
    git config --global color.diff.frag       "magenta bold"
    git config --global color.diff.commit     "yellow bold"
    git config --global color.diff.old        "red bold"
    git config --global color.diff.new        "green bold"
    git config --global color.diff.whitespace "red reverse"
fi
source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
