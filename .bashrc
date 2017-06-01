# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -lah --color=auto'

alias scoop='git add -A && git status --short'

PS1='[\u@\h \W]\$ '
