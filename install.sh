#!/bin/sh

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install wget 
brew install wget

cd ~

# link .ideavimrc
[ -e ".ideavimrc" ] && rm .ideavimrc
ln -s .dotfile/.ideavimrc .ideavimrc

# link git configuration
[ -e ".gitconfig" ] && rm .gitconfig
ln -s .dotfile/.gitconfig .gitconfig

# install zsh
brew install wget

# change default shell -> zsh
chsh -s /bin/zsh

# install oh-my-zsh
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
[ -e ".zshrc" ] && rm .zshrc
ln -s .dotfile/.zshrc .zshrc 

# install powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# install my vimrc
wget -O - https://raw.github.com/ck89119/.vim/master/auto-install.sh | sh
