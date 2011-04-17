# .bashrc
# Bill Israel [http://cubicle17.com/]

# return if not running interactively
[ -z "$PS1" ] && return
. /etc/profile > /dev/null

# behave like vi
set -o vi

# history
HISTCONTROL=ignoredups
HISTSIZE=500
shopt -s histappend
shopt -s cmdhist

# etc
shopt -s checkwinsize

export GREP_OPTIONS="--color=auto"
export GREP_COLOR="1;32"
export EDITOR="vim"
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:usr/X11/bin"


# if we have git completion, use a git-aware prompt
if [ -f /usr/local/bin/git-completion.bash ]; then
	. /usr/local/bin/git-completion.bash
	PS1='\w $(__git_ps1 "(%s) ")\$ '
else
	# use a super-minimal prompt by default
	PS1='\w \$ '
fi

# ls colors
# (via http://github.com/inky/dotfiles/blob/master/home/.bashrc)
uname=$(uname)
if [ "$TERM" != "dumb" ]; then
    case "$uname" in
    Darwin|FreeBSD)
        export CLICOLOR=1
        export LSCOLORS="ExFxCxDxBxegedabagacad"  # legible colours
        ;;
    *)
        if [ -n "`which dircolors`" ]; then
            eval "`dircolors -b`" 2>/dev/null
            alias ls='ls --color=auto' 2>/dev/null
        fi
        ;;
    esac
fi

# Include alias definitions
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Include environment-specific odds-n-ends
if [ -f ~/.bashrc.local ]; then
  . ~/.bashrc.local
fi
