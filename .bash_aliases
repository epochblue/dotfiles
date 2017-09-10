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

# python
alias py="python"
alias wo="workon"

# etc
alias src="cd ~/src"
alias m="mvim --remote-tab-silent"
alias cdns="sudo dscacheutil -flushcache"
alias diff="diff --suppress-common-lines"
alias reload="source ~/.bashrc"
alias t="tree"
alias tl="tree -L"
alias fixopenwith="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user;killall Finder"
alias utime="date +%s"

# `.. 3` will `cd ../../..`
function ..() {
    local dir=""
    local arg=${1:-1}; while [ "$arg" -gt 0 ]; do
        dir="$dir../"; arg=$(($arg - 1))
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
mkcd() { [ -n "$1" ] && mkdir -p "$@" && cd "$1"; }

# simpler find
f() { find . -iname "*$1*"; }

# repeat a command
repeat() { n=$1; shift; while [ $(( n -= 1 )) -ge 0 ]; do "$@"; done; }

# download the audio track from youtube (requires youtube-dl and ffmpeg/avconv)
ytdl() {
    local url=$1
    youtube-dl --add-metadata --audio-format=mp3 --write-all-thumbnails -f 'bestaudio[ext=m4a]' -o '%(title)s.%(ext)s' "$url"
}
