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

# etc
alias get="curl -O"
alias src="cd ~/src"
alias gvim="mvim --remote-silent"


# `.. 3` will `cd ../../..`
function ..() {
    local arg=${1:-1}; while [ $arg -gt 0 ]; do
        local dir="$dir../"; arg=$(($arg - 1))
    done
    cd $dir >& /dev/null;
}

# create directories and cd to the first one
function mkcd() { [ -n "$1" ] && mkdir -p "$@" && cd "$1"; }
