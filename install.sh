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
# Create after directory if it does not exist
if [ ! -d ~/.vim/after ]; then
    mkdir ~/.vim/after
fi
# Create syntax directory if it does not exist
if [ ! -d ~/.vim/after/syntax ]; then
    mkdir ~/.vim/after/syntax
fi
# Copy vim configuration files
cp .vimrc ~/.vimrc
cp .vim/colors/* ~/.vim/colors/
cp .vim/*.vim ~/.vim/after/syntax/

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

# MATPLOTLIB ----------------------------------------------
# Create config directory if it does not exist
if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi
# Create matplotlib directory if it does not exist
if [ ! -d ~/.config/matplotlib ]; then
    mkdir ~/.config/matplotlib
fi
# Create stylelib directory if it does not exist
if [ ! -d ~/.config/matplotlib/stylelib ]; then
    mkdir ~/.config/matplotlib/stylelib
fi
# Copy matplotlib configuration files
cp .matplotlib/* ~/.config/matplotlib/stylelib/

# MISC ----------------------------------------------------
# Copy misc. scripts
cp repo_statuses.sh ~/

# Update .profile
source ~/.profile
