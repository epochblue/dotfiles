# .bash_aliases
# Bill Israel [http://cubicle17.com/]

# ls
alias ls="ls -G"
alias ll="ls -hl"
alias la="ls -Ahl"
alias ltr="ls -hltr"
alias tree="tree --charset=NULL"

# hg
alias hy="hg pull"
alias hp="hg push"
alias hup="hg update"
alias hupg="hg upgrade"
alias hc="hg commit"
alias hlog="hg log"
alias hst="hg status"
alias hin="hg incoming"

# git
alias gs="git status"
alias gf="git fetch"
alias gfo="git fetch origin"
alias gp="git pull"
alias gpo="git pull origin"
alias gco="git checkout"
alias gm="git merge"
alias gsu="git submodule update --init --recursive"

# etc
alias dl="curl -O"
alias src="cd ~/src"
alias m="mvim"
alias flushcache="sudo dscacheutil -flushcache"
alias diff="diff --suppress-common-lines"
alias reload="source ~/.bashrc"

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

