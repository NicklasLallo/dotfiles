# Path
export PATH="/bin/:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
export PATH=~/dotfiles/scripts/:$PATH
export PATH="${PATH}:${HOME}/.local/bin/"
export PATH="${PATH}:${HOME}/.gem/ruby/2.6.0/bin/"
export PATH="${PATH}:${HOME}/aur/imgur-screenshot/"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

# Cuda
export PATH=/opt/cuda/bin${PATH:+:${PATH}}
export CUDA_HOME=/opt/cuda${CUDA_HOME:+:${CUDA_HOME}}
export LD_LIBRARY_PATH=/opt/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export LD_LIBRARY_PATH=/opt/cuda/extras/CUPTI/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

# Go
export GOBIN="$HOME/go/bin"
export GOPATH="$HOME/go"
# FZF
export FZF_DEFAULT_OPS="--extended"
export FD_COMMAND="fdfind"
export FZF_DEFAULT_COMMAND="$FD_COMMAND --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Other
export EDITOR=nvim
export RANGER_LOAD_DEFAULT_RC="FALSE"
export ANDROID_HOME=/opt/android-sdk
export LESS="-M -I -R"
