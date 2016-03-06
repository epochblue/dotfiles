# .bashrc
# Bill Israel [http://cubicle17.com/]

# return if not running interactively
[ -z "$PS1" ] && return
. /etc/profile > /dev/null

# behave like vi
set -o vi

# history
PROMPT_COMMAND='history -a; history -n'
HISTCONTROL=ignoredups
HISTIGNORE='exit:ls:bg:fg:history:clear'
HISTTIMEFORMAT='%F %T '
HISTSIZE=1000
shopt -s histappend
shopt -s cmdhist

# etc
shopt -s checkwinsize

export GREP_OPTIONS="--color=auto"
export GREP_COLOR="1;32"
export EDITOR="vim"
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:usr/X11/bin"
export COPYFILE_DISABLE=true


# virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=1

set_active_venv() {
    export ACTIVE_VENV=""
    if [ "$VIRTUAL_ENV" != "" ]; then
        export ACTIVE_VENV="(`basename \"$VIRTUAL_ENV\"`)"
    fi
}

# Load Homebrew's bash-completion helpers
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

MONTH=$(date +"%m")
case $MONTH in
    01)
        SYMBOL='🎉'
        ;;
    02)
        SYMBOL='❤️'
        ;;
    03)
        SYMBOL='🍀'
        ;;
    04)
        SYMBOL='🐰'
        ;;
    05)
        SYMBOL='☀️'
        ;;
    06)
        SYMBOL='💍'
        ;;
    07)
        SYMBOL='🇺'
        ;;
    08)
        SYMBOL='🎂'
        ;;
    09)
        SYMBOL='🍂'
        ;;
    10)
        SYMBOL='👻'
        ;;
    11)
        SYMBOL='🍗'
        ;;
    12)
        SYMBOL='🎄'
        ;;
    *)
        SYMBOL='☕️'
        ;;
esac

# Default prompt
export PS1="${SYMBOL}  \w \$ "

# Use a git-aware prompt if one is available
if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
    export PROMPT_COMMAND='set_active_venv; __git_ps1 "${ACTIVE_VENV}${SYMBOL}  \w" " \\\$ "'
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
if [ -f ~/.bashrc_local ]; then
  . ~/.bashrc_local
fi

