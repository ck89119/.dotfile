#!/bin/sh

cd ~

# link .ideavimrc
[ -e ".ideavimrc" ] && rm .
ln -s .dotfile/.ideavimrc .ideavimrc

# link git configuration
[ -e ".gitconfig" ] && rm .gitconfig
ln -s .dotfile/.gitconfig .gitconfig

# install zsh
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
