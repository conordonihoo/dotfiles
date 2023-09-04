# ~/.profile: executed by the command interpreter for login shells.

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # source .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	    source "$HOME/.bashrc"
    fi
    # source .bash_prompt if it exists
    if [ -f "$HOME/.bash_prompt" ]; then
	    source "$HOME/.bash_prompt"
    fi
    # source .bash_aliases if it exists
    if [ -f "$HOME/.bash_aliases" ]; then
	    source "$HOME/.bash_aliases"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# load .startup if it exists
if [ -f ~/.startup ]; then
    source ~/.startup
fi
