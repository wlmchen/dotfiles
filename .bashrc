#    _               _
#   | |__   __ _ ___| |__  _ __ ___
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__
# (_)_.__/ \__,_|___/_| |_|_|  \___|
# 


# MPD daemon start (if no other user instance exists)
#[ ! -s ~/.config/mpd/pid ] && mpd

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=nvim
export TERMINAL="st"
export BROWSER="firefox"

# zsh style completion
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'


# fix doas completion
complete -cf doas

# infinite history
HISTSIZE= 
HISTFILESIZE=

#alias ls='ls --color=auto'
alias ls='exa --long --git'
alias ll="ls -la"
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias define='wkdict'
alias pushall='git remote | xargs -L1 -P 4 git push --all'
alias pushalltags='git remote | xargs -L1 -P 4 git push --tags'
alias pullall='find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \;'
alias hackerman="cat /dev/urandom | base64 -w 0 | lolcat"
alias pullall2='\ls | xargs -P10 -I{} git -C {} pull'
alias gac='git add -A ; git commit'
alias vim="nvim"
alias v="nvim"
alias eip='dig +short myip.opendns.com @resolver1.opendns.com'
alias autoremove='sudo pacman -Rcns $(pacman -Qdtq)'
alias ytdl='youtube-dl'
alias watchgenlop='watch -cn 10 genlop -ci'
alias srcinf='makepkg --printsrcinfo > .SRCINFO'
alias sysus="systemctl suspend"
alias py="python"
alias h="history | cut -c 8- | sort | uniq | fzf | tr '\\n' ' ' | xclip -selection c"
alias nf="neofetch"

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME' 

#export TERM="xterm-256color"
# PS1='[\u@\h \W]\$ '
# PS1="\[\e[1;93m\][\[\e[0m\]\[\e[1;94m\]\u\[\e[0m\]\[\e[1;92m\]@\[\e[0m\]\[\e[1;96m\]\h\[\e[0m\] \[\e[1;35m\]\W\[\e[0m\]\[\e[1;93m\]]\[\e[0m\] "
PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

#PS1='\e[0;34m╔══<=\e[m\e[0;32m\u\e[m\e[0;34m>=\e[m \e[0;34m[\e[m\e[0;35m\w\e[m\e[0;34m]\e[m
#\e[0;34m╚══>>> $\e[m '

#PS1="\[\033]0;\u@\h:\w\007\]\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "
#PS1='\[\033[1;32;40m\]\h\[\033[0;37;40m\]:\[\033[34;40m\][\[\033[1;31;40m\]\u\[\033[0;34;40m\]]\[\033[0;37;40m\]:\[\033[35;40m\]\w\[\033[1;33;40m\]#\[\033[0m\] '

LS_COLORS='di=1;35:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90:*.png=35:*.gif=36:*.jpg=35:*.c=92:*.jar=33:*.py=93:*.h=90:*.txt=94:*.doc=104:*.docx=104:*.odt=104:*.csv=102:*.xlsx=102:*.xlsm=102:*.rb=31:*.cpp=92:*.sh=92:*.html=96:*.zip=4;33:*.tar.gz=4;33:*.mp4=105:*.mp3=106'
export LS_COLORS

export PATH="/home/fildo/.gem/ruby/2.7.0/bin:/home/fildo/.local/bin:/home/fildo/bin:/usr/local/bin:$PATH"

mem()
{                                                                                                      
    ps -eo rss,pid,euser,args:100 --sort %mem | grep -v grep | grep -i $@ | awk '{printf $1/1024 "MB"; $1=""; print }'
}

greph()
{
    history | grep $1;
}

dbot()
{
    cd ~/repos/primebot/primebot
    nvim $(\ls -1 | fzf)
}

# startx Xorg on tty1
# if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

# colored manpages (manpages of color)

# export LESS_TERMCAP_mb=$'\e[1;32m'
# export LESS_TERMCAP_md=$'\e[1;32m'
# export LESS_TERMCAP_me=$'\e[0m'
# export LESS_TERMCAP_se=$'\e[0m'
# export LESS_TERMCAP_so=$'\e[01;33m'
# export LESS_TERMCAP_ue=$'\e[0m'
# export LESS_TERMCAP_us=$'\e[1;4;31m'

export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"

# l-beam cursor
printf '\033[6 q'

# for pidswallow 
[ -n "$DISPLAY" ]  && command -v xdo >/dev/null 2>&1 && xdo id > /tmp/term-wid-"$$"
trap "( rm -f /tmp/term-wid-"$$" )" EXIT HUP

source "$HOME/.cargo/env"
