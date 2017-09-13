# .bashrc
# Bill Israel [http://cubicle17.com/]

# return if not running interactively
[ -z "$PS1" ] && return
. /etc/profile > /dev/null

# behave like vi
set -o vi

# etc
shopt -s checkwinsize

export CLICOLOR=1
export EDITOR="vim"
export PATH="~/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:usr/X11/bin"
export COPYFILE_DISABLE=1

# Load Homebrew's bash-completion helpers
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Include related files, if they exist
included_files=( .bash_aliases .bash_colors .bash_prompt .bashrc_local )
for file in "${included_files[@]}"; do
    if [ -f "$HOME/$file" ]; then
        source "$HOME/$file"
    fi
done

