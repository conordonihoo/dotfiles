# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# start SSH agent automatically
if [ -z "$SSH_AUTH_SOCK" ]; then
    # start SSH agent
    eval "$(ssh-agent -s)" &>/dev/null
    # add private key
    ssh-add ~/.ssh/id_rsa 2>/dev/null
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# if on a Apple Silicon computer
if [ "$(uname -m)" == "arm64" ]; then
    # add homebrew to path
    export PATH=/opt/homebrew/bin:$PATH
    # suppress the zsh default warning on mac catalina
    export BASH_SILENCE_DEPRECATION_WARNING=1
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# matplotlib style directory
export MPLCONFIGDIR=$HOME/.config/matplotlib

# add neovim to path
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
