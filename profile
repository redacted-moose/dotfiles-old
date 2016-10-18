# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# Caps Lock is Ctrl as God intended
setxkbmap -option compose:ralt,terminate:ctrl_alt_bksp,ctrl:nocaps

synclient VertTwoFingerScroll=1
synclient HorizTwoFingerScroll=1

synclient PalmDetect=1

synclient TapButton1=1
synclient TapButton2=2
synclient TapButton3=3


# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include bash exports
	[[ -f "$HOME/.bash/exports" ]] && . "$HOME/.bash/exports"
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi

if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
	eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

if [ -x /usr/bin/xdg-user-dirs-update ]; then
	/usr/bin/xdg-user-dirs-update
fi
