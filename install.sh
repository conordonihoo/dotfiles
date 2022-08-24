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
