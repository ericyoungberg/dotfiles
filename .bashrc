#/
#// .bashrc
#/

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Aliases
# ===============================================
alias ls='ls --color=auto'
alias la='ls -lah --color=auto'

alias scoop='git add -A && git status --short'

alias shutdown="sudo shutdown -P now"


# Settings
# ===============================================

export TERM=xterm-256color
export PS1="\[\e[1;36m\][\h] \[\033[01;32m\]\u\[\033[01;34m\] \W \$\[\033[00m\] "


# Environments
# ===============================================

source ~/.git-completion.bash

export NVM_DIR="/home/eric/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use 7.10.0
