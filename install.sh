#!/bin/sh

cd ~

# link aria2
[ -e ".aria2" ] && rm -rf .aria2
ln -s .dotfile/.aria2 .aria2

# link tmux configuration
[ -e ".tmux.conf" ] && rm .tmux.conf
ln -s .dotfile/.tmux.conf .tmux.conf

# link git configuration
[ -e ".gitconfig" ] && rm .gitconfig
ln -s .dotfile/.gitconfig .gitconfig

# install zsh
sudo apt-get install zsh
chsh -s /bin/zsh

# install oh-my-zsh
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
[ -e ".zshrc" ] && rm .zshrc
ln -s .dotfile/.zshrc .zshrc 

# install powerline-theme in oh-my-zsh
cd .dotfile
git submodule update --init --recursive
cd oh-my-zsh-powerline-theme
./install_in_omz.sh

# install my vimrc
wget -O - https://raw.github.com/ck89119/.vim/master/auto-install.sh | sh

# install my spacemacs
wget -O - https://raw.github.com/ck89119/.spacemacs.d/master/install.sh | sh
