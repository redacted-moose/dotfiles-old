# if not running interactively, don't do anything
case $- in
	*i*) ;;
	  *) return;;
esac

# Bash completion
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

# Set up prompt
if [[ $TERM == xterm-termite ]]; then
	. /etc/profile.d/vte.sh
	__vte_prompt_command
fi

if (echo "$TERM" | grep -qe "256color\|termite") && [[ -f ~/bin/promptline ]]; then
    source ~/bin/promptline
else
    # prompt
    PS1='[\u@\h \W]\$ '
    BROWSER=/usr/bin/xdg-open
fi

# Dircolors if available
[[ -f ~/.dir_colors ]] && eval `dircolors ~/.dir_colors`

xhost +local:root > /dev/null 2>&1

complete -cf sudo

set -o noclobber
set -o vi

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

[[ -f ~/.bash/aliases ]] && source ~/.bash/aliases

[[ -f ~/.bash/functions ]] && source ~/.bash/functions

if [[ -f ~/.fzf.bash ]]; then
	source ~/.fzf.bash
elif [[ -d /usr/share/fzf ]]; then
	source /usr/share/fzf/completion.bash
	source /usr/share/fzf/key-bindings.bash
fi

# [[ -f /etc/profile.d/fzf-extras.bash ]] && source /etc/profile.d/fzf-extras.bash
# [[ -f ~/.local/bin/fzf-extras ]] && source ~/.local/bin/fzf-extras
[[ -d ~/.fzf-extras ]] && source ~/.fzf-extras/fzf-extras.sh
