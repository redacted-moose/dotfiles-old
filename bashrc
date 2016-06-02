# Bash completion
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# Dircolors if available
if [[ -f ~/.dir_colors ]]; then
	eval `dircolors ~/.dir_colors`
fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

set -o noclobber

shopt -s cdspell
shopt -s dirspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

bind Space:magic-space

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL='erasedups:ignoreboth'
export HISTIGNORE="&:[ ]*:exit"
export EDITOR=vim
export SUDO_EDITOR=${EDITOR}
export VISUAL='emacsclient -c -a emacs'
export BROWSER=google-chrome-stable
export TERMINAL=termite
export PROMPT_COMMAND='history -a'
# export NVIM_TUI_ENABLE_CURSOR_SHAPE=1
export NVIM_TUI_ENABLE_TRUE_COLOR=1

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto -d skip'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias fuck='eval $(thefuck $(fc -ln -1)); history -r'
alias fixit='sudo rm -f /var/lib/pacman/db.lck'
# alias update='yaourt -Syua'
alias update='pacaur -Syuua'
alias con='$EDITOR $HOME/.i3/config'
alias comp='$EDITOR $HOME/.config/compton.conf'
alias inst='sudo pacman -S'
alias mirrors='sudo pacman-mirrors -g'
alias db='sudo pacman -Syy'
alias pkgbuild='$EDITOR PKGBUILD'
alias printer='system-config-printer'
alias mount='mount | column -t'

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"   ;;
      *.tar.gz)    tar xzf "$1"   ;;
      *.bz2)       bunzip2 "$1"   ;;
      *.rar)       unrar x "$1"     ;;
      *.gz)        gunzip "$1"    ;;
      *.tar)       tar xf "$1"    ;;
      *.tbz2)      tar xjf "$1"   ;;
      *.tgz)       tar xzf "$1"   ;;
      *.zip)       unzip "$1"     ;;
      *.Z)         uncompress "$1";;
      *.7z)        7z x "$1"      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# powerline_path=$(python -c 'import os, sys, powerline; sys.stdout.write(os.path.dirname(powerline.__file__))' 2> /dev/null)
# if (echo "$TERM" | grep -qe "256color\|termite") && [[ "$powerline_path" ]]; then
#   powerline-daemon -q
#   POWERLINE_BASH_CONTINUATION=1
#   POWERLINE_BASH_SELECT=1
#   source ${powerline_path}/bindings/bash/powerline.sh
# else
#   # prompt
#   PS1='[\u@\h \W]\$ '
#   BROWSER=/usr/bin/xdg-open
# fi

source ~/bin/promptline

readme() {
	for file in *[Rr][Ee][Aa][Dd][Mm][Ee]*; do
		if [ $file != '*[Rr][Ee][Aa][Dd][Mm][Ee]*' ]; then
			$EDITOR $file
			break
		fi
	done
}
