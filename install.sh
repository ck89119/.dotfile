#!/bin/sh

cd ~

# link .ideavimrc
[ -e ".ideavimrc" ] && rm .
ln -s .dotfile/.ideavimrc .ideavimrc

# link git configuration
[ -e ".gitconfig" ] && rm .gitconfig
ln -s .dotfile/.gitconfig .gitconfig

# change default shell -> zsh
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

# install powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# install my vimrc
wget -O - https://raw.github.com/ck89119/.vim/master/auto-install.sh | sh
