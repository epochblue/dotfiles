# .bash_aliases
# Bill Israel [http://cubicle17.com/]

# ls
alias ls="ls -G"
alias l="ls -Ahl"
alias ll="ls -hl"
alias la="l"
alias ltr="ls -hltr"
alias tree="tree --charset=NULL"

# git
alias gst="git status"
alias gfo="git fetch origin"
alias gsu="git submodule update --init --recursive"
alias gc="git commit"

# etc
alias src="cd ~/src"
alias m="mvim --remote-tab-silent"
alias cdns="sudo dscacheutil -flushcache"
alias diff="diff --suppress-common-lines"
alias reload="source ~/.bashrc"
alias t="tree"
alias fixopenwith="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user;killall Finder"

# `.. 3` will `cd ../../..`
function ..() {
    local arg=${1:-1}; while [ $arg -gt 0 ]; do
        local dir="$dir../"; arg=$(($arg - 1))
    done
    cd $dir >& /dev/null;
}

# generate a random password
function gpw() {
    local length=$1
    [ -z "$length" ] && length=20
    case `uname` in
        Darwin)
            LC_CTYPE=C tr -dc "A-Za-z0-9&^%$#@" < /dev/urandom | head -c ${length} | xargs
            ;;

        *)
            tr -dc "A-Za-z0-9&^%$#@" < /dev/urandom | head -c ${length} | xargs
            ;;
    esac
}

# create directories and cd to the first one
function mkcd() { [ -n "$1" ] && mkdir -p "$@" && cd "$1"; }

# simpler find
function f() { find . -iname "*$1*"; }

