# set default tmux to use 256 colors and utf-8 encoding
alias tmux='tmux -2u'

# ls aliases
alias ll='ls -alF'
alias ls='ls -CF'

# searching aliases
alias grep='grep --color'
ff() {
    if [ $# = 1 ]; then
        # find file alias: $ff <file name>
        find . -type f | grep -i "$1"
    else
        # find file alias: $ff <searching directory> <file name>
        find "$1" -type f | grep -i "$2"
    fi
}
fd() {
    if [ $# = 1 ]; then
        # find directory alias: $fd <directory name>
        find . -type d | grep -i "$1"
    else
        # find directory alias: $fd <searching directory> <directory name>
        find "$1" -type d | grep -i "$2"
    fi
}

# get moon phase and weather
wthr () {
    echo ""
    # moon
    curl wttr.in/moon
    echo -e "\x1b[3A\x1b[0J"
    # weather
    curl wttr.in
    echo -e "\x1b[39A\x1b[2K\x1b[1B\x1b[2K\x1b[37B\x1b[2K\x1b[1A"
}

# git aliases
alias gitb="git branch"
alias gits="git status"
alias gitl="git log"
alias gitll="git log --decorate --graph --oneline"
alias gup="git submodule init && git submodule update"
gitch () { 
    git checkout `git branch | grep $1` 
}

# vim aliases
alias vi="vim"

# python aliases
alias python="python3"
alias pip="pip3"

# docker aliases
alias dimg='docker images'
alias dcnt='docker ps -a'

# trick aliases
alias trick-CP="trick-CP TRICKIFIED=1"
alias trick-RB="make spotless && trick-CP"

# Cesium aliases
alias ceez="node server.js --public --port 5080"
