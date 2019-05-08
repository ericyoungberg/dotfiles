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

# Lock screen
alias lock='i3lock -c 000000 -f'

# Git shortcuts
alias scoop='git add -A && git status --short'
alias grog='git log --oneline | head -5'

# Tmux shortcuts
alias tmuxl='tmux list-sessions'
alias tmuxd='tmux kill-session -t'
alias tmuxr='tmux rename-session -t'

# Settle network issues
alias resnet="sudo systemctl restart network-manager"


# Settings
# ===============================================

export TERM=xterm-256color
export PS1="\\[\\e[1;36m\\][\\h] \\[\\033[01;32m\\]\\u\\[\\033[01;34m\\] \\W \$\\[\\033[00m\\] "

[[ -x "$(command -v xset)" ]] && xset r rate 160 25

# shellcheck source=/dev/null
[[ -s "$HOME/.screenlayout/layout" ]] && source "$HOME/.screenlayout/layout"


# Environments
# ===============================================

# shellcheck source=/dev/null 
source "$HOME/.git-completion.bash"

# shellcheck source=/dev/null
[[ -s "$HOME/.config/wtf/.env" ]] && source "$HOME/.config/wtf/.env"

export PATH=$PATH:/usr/local/sbin

# Add Go to PATH
export GOPATH=$HOME/go
export GOROOT=/usr/lib/go
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# shellcheck source=/dev/null
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Add Yarn global binaries
export PATH="$PATH:$HOME/.yarn/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Execute any local machine configuration. 
# Note: the .localrc file should never be committed, hence "local"

# shellcheck source=/dev/null
[[ -s "$HOME/.localrc" ]] && source "$HOME/.localrc"
