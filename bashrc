#               __                                                            _..._
#   .--.     /)/ /\                                                        .-'_..._''.
#  /.''\\._.'// /  '/|                               .                   .' .'      '.\
# (/    `---'/ /  / ||                             .'|                  / .'
#           / /  /  ||                            <  |         .-,.--. . '
#          / /  /   ||  __        __               | |         |  .-. || |
#         / /  /    ||/'__ '.  .:--.'.         _   | | .'''-.  | |  | || |
#        / /  /     |:/`  '. '/ |   \ |      .' |  | |/.'''. \ | |  | |. '
#       / /  /,.--. ||     | |`" __ | |     .   | /|  /    | | | |  '-  \ '.          .
#      / /  ///    \||\    / ' .'.''| |   .'.'| |//| |     | | | |       '. `._____.-'/
#     /_/  / \\    /|/\'..' / / /   | |_.'.'.-'  / | |     | | | |         `-.______ /
#     \ \ /   `'--' '  `'-'`  \ \._,\ '/.'   \_.'  | '.    | '.|_|                  `
#      --'                     `--'  `"            '---'   '---'
#

# if not running interactively, don't do anything
case $- in
	*i*) ;;
	  *) return;;
esac

# [[ -f ~/.bash/exports ]] && source ~/.bash/exports
[[ -f ~/.bash/aliases ]] && source ~/.bash/aliases
[[ -f ~/.bash/functions ]] && source ~/.bash/functions


# Bash completion
if ! shopt -oq posix; then
	if [[ -f /usr/share/bash-completion/bash_completion ]]; then
		. /usr/share/bash-completion/bash_completion
	elif [[ -f /etc/bash_completion ]]; then
		. /etc/bash_completion
	fi
fi

# Set up prompt
if [[ $TERM == xterm-termite ]]; then
	. /etc/profile.d/vte.sh
	__vte_prompt_command
else
	unset PROMPT_COMMAND
fi

if (echo "$TERM" | grep -qe "256color\|termite") && [[ -f ~/bin/promptline ]]; then
    source ~/bin/promptline
else
    # prompt
    PS1='[\u@\h \W]\$ '
    # BROWSER=/usr/bin/xdg-open
fi

# if [[ -n "$DISPLAY" ]]; then
#     export BROWSER=firefox
# fi

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

if [[ -f ~/.fzf.bash ]]; then
	source ~/.fzf.bash
elif [[ -d /usr/share/fzf ]]; then
	source /usr/share/fzf/completion.bash
	source /usr/share/fzf/key-bindings.bash
fi

[[ -d ~/.fzf-extras ]] && source ~/.fzf-extras/fzf-extras.sh

# added by Anaconda3 4.2.0 installer
# export PATH="/home/chris/.anaconda/bin:$PATH"
