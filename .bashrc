#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias define='wkdict'
alias pushall='git remote | xargs -L1 git push --all'

# PS1='[\u@\h \W]\$ '
PS1="\[\e[1;93m\][\[\e[0m\]\[\e[1;94m\]\u\[\e[0m\]\[\e[1;92m\]@\[\e[0m\]\[\e[1;96m\]\h\[\e[0m\] \[\e[1;35m\]\W\[\e[0m\]\[\e[1;93m\]]\[\e[0m\] "
export PATH="/home/fildo/.local/bin:/home/fildo/bin:$PATH"
export TERM=xterm-256color
