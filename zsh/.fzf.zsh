# Setup fzf
# ---------
if [[ ! "$PATH" == */home/la1/.fzf/bin* ]]; then
  export PATH="$PATH:/home/la1/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/la1/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/la1/.fzf/shell/key-bindings.zsh"

