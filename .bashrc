#
# // .bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Aliases
# ===============================================

# General
if [ "$(uname)" == "Darwin" ]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi
alias la='ls -lah'

# Git shortcuts
alias scoop='git add -A && git status --short'
alias grog='git log --oneline | head -5'

# Tmux shortcuts
alias tmuxl='tmux list-sessions'
alias tmuxd='tmux kill-session -t'
alias tmuxr='tmux rename-session -t'


# Settings
# ===============================================

export TERM=xterm-256color
export PS1="\\[\\e[1;36m\\][\\h] \\[\\033[01;32m\\]\\u\\[\\033[01;34m\\] \\W \$\\[\\033[00m\\] "


# Environments
# ===============================================

# shellcheck source=/dev/null 
source "$HOME/.git-completion.bash"

# shellcheck source=/dev/null
[[ -s "$HOME/.wtf/.env" ]] && source "$HOME/.wtf/.env"

export PATH=$PATH:/usr/local/sbin

# Add Go to PATH
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# shellcheck source=/dev/null
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
