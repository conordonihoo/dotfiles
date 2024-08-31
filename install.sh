#!/bin/bash

# SHELL ---------------------------------------------------
# Copy shell-related configuration files
cp .profile ~/
cp .bashrc ~/
cp .bash_prompt ~/
cp .bash_aliases ~/
cp .inputrc ~/
cp .ackrc ~/
# Create config directory if it does not exist
if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

# VIM -----------------------------------------------------
# Create vim directory if it does not exist
if [ ! -d ~/.vim ]; then
    mkdir ~/.vim
fi
# Create colors directory if it does not exist
if [ ! -d ~/.vim/colors ]; then
    mkdir ~/.vim/colors
fi
# Create syntax directory if it does not exist
if [ ! -d ~/.vim/syntax ]; then
    mkdir ~/.vim/syntax
fi
# Copy vim configuration files
cp .vimrc ~/.vimrc
cp .vim/colors/* ~/.vim/colors/
cp .vim/syntax/* ~/.vim/syntax/

# NEOVIM --------------------------------------------------
# Create nvim directory if it does not exist
if [ ! -d ~/.config/nvim ]; then
    mkdir ~/.config/nvim
fi
cp -r nvim/* ~/.config/nvim/

# TMUX ----------------------------------------------------
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
#cp gitExec.sh ~/
#cp runTest.sh ~/

# Update .profile
source ~/.profile
