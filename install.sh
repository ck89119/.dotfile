#!/bin/sh

# if mac os
if [ `uname` = "Darwin" ]; then
    # set proxy
    export http_proxy=http://127.0.0.1:1089 https_proxy=http://127.0.0.1:1089

    # install homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    brew install ack
    brew install bat
    brew install fd
    brew install fzf
    brew install git-delta
    brew install ripgrep
elif [ `uname` = "Linux" ]; then
    sudo apt-get install zsh
fi

# change default shell -> zsh
chsh -s /bin/zsh

cd ~

# install oh-my-zsh
[ -e ".oh-my-zsh" ] && rm -rf .oh-my-zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# link .zshrc configuration
[ -e ".zshrc" ] && rm .zshrc
ln -s .dotfile/.zshrc .zshrc 

# link .ideavimrc
[ -e ".ideavimrc" ] && rm .ideavimrc
ln -s .dotfile/.ideavimrc .ideavimrc

# link git configuration
[ -e ".gitconfig" ] && rm .gitconfig
ln -s .dotfile/.gitconfig .gitconfig

git clone https://github.com/Karmenzind/monaco-nerd-fonts fonts/monaco-nerd-fonts

# install my vimrc
/bin/bash -c "$(curl -fsSL https://raw.github.com/ck89119/.vim/master/auto-install.sh)"
