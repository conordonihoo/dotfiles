# Update submodules in dotfiles
git submodule init
git submodule update

# Update submodules in simenv
if [ -d $HOME/simenv ]; then
    cd $HOME/simenv
    git submodule init
    git submodule update
    cd -
fi

# SHELL ---------------------------------------------------
# Copy shell-related configuration files
cp .profile ~/
cp .bashrc ~/
cp .bash_prompt ~/
cp .bash_aliases ~/
cp .inputrc ~/
cp .ackrc ~/

# VIM -----------------------------------------------------
# Create vim configuration directory
cp -r .vim/ ~/

# TMUX ----------------------------------------------------
# Create tmux configuration directory
cp -r .tmux/ ~/
cp .tmux.conf ~/

# MATPLOTLIB / PYSTICKYNOTE -------------------------------
## Create matplotlib and pysn settings directory if they do
## not exist
if [ ! -d ~/.config ]; then
    mkdir ~/.config
    mkdir ~/.config/matplotlib
    mkdir ~/.config/pystickynote
else
    if [ ! -d ~/.config/matplotlib ]; then
        mkdir ~/.config/matplotlib
    fi
    if [ ! -d ~/.config/pystickynote ]; then
        mkdir ~/.config/pystickynote
    fi
fi
cp matplotlibrc ~/.config/matplotlib/
cp pysn.conf ~/.config/pystickynote/

# IPYTHON -------------------------------------------------
# Create ipython settings directory if it does not exist
if [ ! -d ~/.ipython ]; then
    mkdir ~/.ipython
fi
cp -r .ipython/* ~/.ipython

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

# Augment some dot files if in Windows
if [ $(uname) != Linux ]; then
    export WIN_HOME="/c/Users/<first>.<last>"
    cp win/.dir_colors ~/
    cp win/.minttyrc ~/
    echo "" >> ~/.bashrc
    echo "export WIN_HOME=$WIN_HOME" >> ~/.bashrc
    # Install `pacman' Packages
    pacman -Syu --noconfirm # MSYS2 webpage recommends closing MSYS2, running it again, and executing `pacman -Su'
    pacman -S --noconfirm make git diffutils tar
fi

