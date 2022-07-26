# /etc/bash.bashrc

# Don't do anything if not running interactively.
[[ $- != *i* ]] && return

# Check the terminal size when it regains control.
shopt -s checkwinsize

# Enable history appending instead of overwriting it.
shopt -s histappend

# Change the window title of terminals.
case ${TERM} in
	[aEkx]term*|rxvt*|gnome*|konsole*|interix|tmux*)
		PS1='\[\033]0;\u@\h: \w\007\]'
		;;
	screen*)
		PS1='\[\033k\u@\h: \w\033\\\]'
		;;
	*)
		unset PS1
		;;
esac

# Should we use colors on this terminal?
colorful_on=false

case "$TERM" in
    xterm-color|*-256color) colorful_on=yes;;
esac

# Enable color support of ls.
if [[ -x /usr/bin/dircolors ]]; then
        LS_COLORS=
	if [[ -f ~/.dir_colors ]] ; then
		eval "$(dircolors -b ~/.dir_colors)"
	elif [[ -f /etc/DIR_COLORS ]] ; then
		eval "$(dircolors -b /etc/DIR_COLORS)"
	else
		eval "$(dircolors -b)"
	fi
	if [[ -n ${LS_COLORS:+set} ]] ; then
		colorful_on=true
	else
		unset LS_COLORS
	fi
fi

if ${colorful_on} ; then
        # Different prompt for root.
	if [[ ${EUID} == 0 ]] ; then
		PS1+='\[\033[01;31m\]\h\[\033[01;35m\]\w\[\033[00m\]\$ '
	else
		PS1+='\[\033[01;32m\]\u@\h\[\033[01;34m\]\w\[\033[00m\]\$ '
	fi
	
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
	alias egrep='grep -E --color=auto'
	alias fgrep='grep -F --color=auto'
else
	# Show root username when we don't have colors.
	PS1+='\u@\h \w \$ '
fi

# Import all additional scripts from /etc/bashrc.d/.
for sh in /etc/bashrc.d/* ; do
	[[ -r ${sh} ]] && . "${sh}"
done

unset colorful_on sh