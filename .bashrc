# .bashrc
# Bill Israel [http://cubicle17.com/]

# return if not running interactively
[ -z "$PS1" ] && return
source /etc/profile > /dev/null

# behave like vi
set -o vi

# etc
shopt -s checkwinsize

export CLICOLOR=1
export EDITOR="vim"
export PATH="$HOME/bin:/usr/local/bin:/opt/homebrew/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:usr/X11/bin"
export COPYFILE_DISABLE=1

# Load Homebrew's bash-completion helpers
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# Include related files, if they exist
included_files=( .bash_aliases .bash_colors .bash_prompt .bashrc_local )
for file in "${included_files[@]}"; do
    if [ -f "$HOME/$file" ]; then
        source "$HOME/$file"
    fi
done

