PROMPT_COMMAND="$PROMPT_COMMAND; history -a; history -n"
HISTCONTROL=ignoredups
HISTIGNORE='exit:ls:bg:fg:history:clear'
HISTTIMEFORMAT='%F %T '
HISTSIZE=1000
shopt -s histappend
shopt -s cmdhist

