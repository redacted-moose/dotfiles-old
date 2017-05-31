#
# ~/.bash_profile
#

if [[ -r ~/.profile ]]; then . ~/.profile; fi
# if running interactively, source bashrc
case "$-" in *i*) if [[ -r ~/.bashrc ]]; then . ~/.bashrc; fi;; esac
