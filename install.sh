#!/bin/bash

# SHELL ---------------------------------------------------
# Copy shell-related configuration files
cp .profile ~/
cp .bashrc ~/
cp .bash_prompt ~/
cp .bash_aliases ~/
cp .inputrc ~/
cp .ackrc ~/

# VIM -----------------------------------------------------
# Create vim directory if it does not exist
if [ ! -d ~/.vim ]; then
    mkdir ~/.vim
fi
# Create colors directory if it does not exist
if [ ! -d ~/.vim/colors ]; then
    mkdir ~/.vim/colors
fi
# Create vim configuration directory
cp .vim/colors/apprentice.vim ~/.vim/colors/
cp .vim/.vimrc ~/

# TMUX ----------------------------------------------------
# Create tmux configuration directory
cp .tmux.conf ~/

# SSH -----------------------------------------------------
# Create ssh directory if it does not exist
if [ ! -d ~/.ssh ]; then
    mkdir ~/.ssh
fi
cp .ssh/config ~/.ssh
chmod 0600 ~/.ssh/config

# GIT -----------------------------------------------------
cp .gitconfig ~/

# MISC ----------------------------------------------------
# Copy misc. scripts
cp repo_statuses.sh ~/

# Update .profile
source ~/.profile
