# .bash_aliases
# Bill Israel [http://cubicle17.com/]

# ls
alias ls="ls -G"
alias l="ls -Ahl"
alias ll="ls -hl"
alias la="l"
alias ltr="ls -hltr"
alias tree="tree --charset=NULL"

# hg
alias hpl="hg pull"
alias hpu="hg push"
alias hup="hg update"
alias hug="hg upgrade"
alias hc="hg commit"
alias hlog="hg log"
alias hst="hg status"
alias hin="hg incoming"

# git
alias gst="git status"
alias gfo="git fetch origin"
alias gsu="git submodule update --init --recursive"
alias gc="git commit"

# etc
alias src="cd ~/src"
alias m="mvim --remote-tab-silent"
alias dnsf="sudo dscacheutil -flushcache"
alias diff="diff --suppress-common-lines"
alias reload="source ~/.bashrc"
alias t="tree"

# `.. 3` will `cd ../../..`
function ..() {
    local arg=${1:-1}; while [ $arg -gt 0 ]; do
        local dir="$dir../"; arg=$(($arg - 1))
    done
    cd $dir >& /dev/null;
}

# create directories and cd to the first one
function mkcd() { [ -n "$1" ] && mkdir -p "$@" && cd "$1"; }

# simpler find
function f() { find . -iname "*$1*"; }

# symfony find
function syf() { find . -iname "$1" | grep -v "cache"; }

