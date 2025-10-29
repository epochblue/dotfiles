# .bash_aliases
# Bill Israel [http://cubicle17.com/]

# ls
alias ls="ls -G"
alias l="ls -Ahl"
alias ll="ls -hl"
alias la="l"
alias ltr="ls -hltr"
alias tree="tree --charset=NULL"

# etc
alias cdns='sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder'
alias diff="diff --suppress-common-lines"
alias rerc="source ~/.bashrc"
alias src="cd ~/src"
alias t="tree"
alias fixopenwith="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user;killall Finder"
alias utime="date +%s"
alias uuidgen='uuidgen | tr "[:upper:]" "[:lower:]"'

weather() {
    where=$1
    if [ -z "$where" ]; then
        where="37205"
    fi

    curl "wttr.in/$where?Q&0"
}

# `.. 3` will `cd ../../..`
..() {
    local dir=""
    local arg=${1:-1}; while [ "$arg" -gt 0 ]; do
        dir="$dir../"; arg=$(($arg - 1))
    done
    cd $dir >& /dev/null;
}

# generate a random password
gpw() {
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

heic2jpg() {
    for i in $(ls *.HEIC); do
        f=$(basename -s .HEIC $i)
        sips -s format jpeg $i --out "$f.jpg" --resampleWidth 1000
    done;

    # run it again in case there are lowercase extensions
    for i in $(ls *.heic); do
        f=$(basename -s .heic $i)
        sips -s format jpeg $i --out "$f.jpg" --resampleWidth 1000
    done;
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
    yt-dlp --add-metadata --write-thumbnail --convert-thumbnails "jpg" -f "m4a" -o '%(title)s.%(ext)s' "$url"
}

# run the given file through github's markdown parser
ghmarkdown() {
    in=$1
    if [ -z "$in" ]; then
        echo "Error: input file required."
        exit 1
    fi

    out=$2
    if [ -z "$out" ]; then
        out="$HOME/Desktop/markdown.html"
    fi

    jq --slurp --raw-input '{"text": "\(.)", "mode": "markdown"}' < "$in" | curl -s --data @- https://api.github.com/markdown > $out
}
