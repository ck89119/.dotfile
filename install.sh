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

# link p10k.zsh configuration
[ -e ".p10k.zsh" ] && rm .p10k.zsh
ln -s .dotfile/.p10k.zsh .p10k.zsh

# install zsh
brew install zsh

# change default shell -> zsh
chsh -s /bin/zsh

# install oh-my-zsh
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
[ -e ".zshrc" ] && rm .zshrc
ln -s .dotfile/.zshrc .zshrc 

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install zsh-autosuggestions 
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install my vimrc
wget -O - https://raw.github.com/ck89119/.vim/master/auto-install.sh | sh
