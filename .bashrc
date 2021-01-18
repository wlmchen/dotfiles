#
# ~/.bashrc
#
# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias ls='ls --color=auto'
alias ll="ls -la"
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias define='wkdict'
alias pushall='git remote | xargs -L1 -P 4 git push --all'
alias gac='git add -A ; git commit'
alias vim="nvim"
alias eip='dig +short myip.opendns.com @resolver1.opendns.com'
alias autoremove='sudo pacman -Rcns $(pacman -Qdtq)'
alias suckbuild='rm -f config.h ; sudo make install'
alias ytdl='youtube-dl'
alias watchgenlop='watch -cn 10 genlop -ci'
alias srcinf='makepkg --printsrcinfo > .SRCINFO'
alias sysus="systemctl suspend"

#export TERM="xterm-256color"
# PS1='[\u@\h \W]\$ '
# PS1="\[\e[1;93m\][\[\e[0m\]\[\e[1;94m\]\u\[\e[0m\]\[\e[1;92m\]@\[\e[0m\]\[\e[1;96m\]\h\[\e[0m\] \[\e[1;35m\]\W\[\e[0m\]\[\e[1;93m\]]\[\e[0m\] "
PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
#PS1="\[\033]0;\u@\h:\w\007\]\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "

#PS1='\[\033[1;32;40m\]\h\[\033[0;37;40m\]:\[\033[34;40m\][\[\033[1;31;40m\]\u\[\033[0;34;40m\]]\[\033[0;37;40m\]:\[\033[35;40m\]\w\[\033[1;33;40m\]#\[\033[0m\] '

export PATH="/home/fildo/.gem/ruby/2.7.0/bin:/home/fildo/.local/bin:/home/fildo/bin:/usr/local/bin:$PATH"
export EDITOR=nvim

mem()
{                                                                                                      
    ps -eo rss,pid,euser,args:100 --sort %mem | grep -v grep | grep -i $@ | awk '{printf $1/1024 "MB"; $1=""; print }'
}


# if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

#if [[ $(ps --no-header --pid=$PPID --format=cmd) != "fish" ]]
#then
#	exec fish
#fi

# colored manpages

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# l-beam cursor
printf '\033[6 q'

# for pidswallow 
[ -n "$DISPLAY" ]  && command -v xdo >/dev/null 2>&1 && xdo id > /tmp/term-wid-"$$"
trap "( rm -f /tmp/term-wid-"$$" )" EXIT HUP

