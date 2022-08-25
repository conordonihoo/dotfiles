#!/bin/bash

# SHELL ---------------------------------------------------
# Copy shell-related configuration files
cp .profile $HOME/
cp .bashrc $HOME/
cp .bash_prompt $HOME/
cp .bash_aliases $HOME/
cp .inputrc $HOME/
cp .ackrc $HOME/

# VIM -----------------------------------------------------
# Create vim configuration directory
cp -r .vim/colors/ $HOME/.vim/colors/
cp .vim/.vimrc $HOME/

# TMUX ----------------------------------------------------
# Create tmux configuration directory
cp .tmux.conf $HOME/

# SSH -----------------------------------------------------
# Create ssh directory if it does not exist
if [ ! -d $HOME/.ssh ]; then
    mkdir $HOME/.ssh
fi
cp .ssh/config $HOME/.ssh
chmod 0600 $HOME/.ssh/config

# GIT -----------------------------------------------------
cp .gitconfig $HOME/

# MISC ----------------------------------------------------
# Copy misc. scripts
cp repo_statuses.sh $HOME/

# Update .profile
source $HOME/.profile
