# ~/.profile: executed by Bourne-compatible login shells.

# Import local .bashrc if running bash.
if [ -n "BASH_VERSION" ]; then
        [ -f ~/.bashrc ] && source ~/.bashrc
fi

# Add local bin directory into PATH.
if [ -d "$HOME/.local/bin" ]; then
        PATH="$HOME/.local/bin:$PATH"
fi

# Might fail after "su - myuser" when /dev/tty* is not writable by "myuser".
mesg n 2>/dev/null
