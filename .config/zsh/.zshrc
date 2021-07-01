[ ! -s ~/.config/mpd/pid ] && mpd

HISTFILE=~/.local/share/history
HISTSIZE=1000000
SAVEHIST=1000000

#bindkey -v # vi mode

unsetopt nomatch # https globbing

autoload -Uz compinit
zstyle ':completion:*' menu select
compinit
_comp_options+=(globdots)		# Include hidden files.

zstyle ':completion:*:*:git:*' script ~/.config/zsh/git-completion.bash
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
fpath=(~/.config/zsh $fpath)

autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd       # cd into typed directory
setopt correct
stty stop undef		# Disable ctrl-s to freeze terminal.



bindkey  "^[[H"   beginning-of-line
bindkey  "^[[4~"   end-of-line

setopt interactivecomments

bindkey -v

bindkey '^R' history-incremental-search-backward # reverse-i-search

export KEYTIMEOUT=1

function cd() {
  if [[ -d ./venv ]] ; then
    deactivate
  fi

  builtin cd $1

  if [[ -d ./venv ]] ; then
    . ./venv/bin/activate
  fi
}


zstyle -e ':completion:*:default' list-colors 'reply=("${PREFIX:+=(#bi)($PREFIX:t)(?)*==34=34}:${(s.:.)LS_COLORS}")';

# Change cursor based on vi mode
function _set_cursor() {
    echo -ne "\ePtmux;\e\e$1\e\\"
}

function _set_block_cursor() { _set_cursor '\e[2 q' }
function _set_beam_cursor() { _set_cursor '\e[6 q' }

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
      _set_block_cursor
  else
      _set_beam_cursor
  fi
}
zle -N zle-keymap-select
# ensure beam cursor when starting new terminal
precmd_functions+=(_set_beam_cursor) #
# ensure insert mode and beam cursor when exiting vim
zle-line-init() { zle -K viins; _set_beam_cursor }

# aliases
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
alias delpycache='find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf'

compile() {
	echo $1 | entr -c sh -c "cc -Wall $1 && ./a.out"
}

# open files with vim
#alias -s {md,py}=nvim

# source pluginz
for plugin in $(find ~/.config/zsh/plugins -name '*.plugin.zsh'); do
    source $plugin
done
