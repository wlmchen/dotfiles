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
alias eip='dig +short myip.opendns.com @resolver1.opendns.com'

# PS1='[\u@\h \W]\$ '
PS1="\[\e[1;93m\][\[\e[0m\]\[\e[1;94m\]\u\[\e[0m\]\[\e[1;92m\]@\[\e[0m\]\[\e[1;96m\]\h\[\e[0m\] \[\e[1;35m\]\W\[\e[0m\]\[\e[1;93m\]]\[\e[0m\] "

#PS1="\[\033]0;\u@\h:\w\007\]\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "

export PATH="/home/fildo/.gem/ruby/2.7.0/bin:/home/fildo/.local/bin:/home/fildo/bin:$PATH"
export TERM=xterm-256color
export EDITOR=nvim


if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi
#if [[ $(ps --no-header --pid=$PPID --format=cmd) != "fish" ]]
#then
#	exec fish
#fi

# l-beam cursor
printf '\033[6 q'

[ -n "$DISPLAY" ]  && command -v xdo >/dev/null 2>&1 && xdo id > /tmp/term-wid-"$$"
trap "( rm -f /tmp/term-wid-"$$" )" EXIT HUP
