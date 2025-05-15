#!/bin/sh

# if mac os
if [ `uname` = "Darwin" ]; then
    # set proxy
    export http_proxy=http://127.0.0.1:1089 https_proxy=http://127.0.0.1:1089

    # install homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    brew install bat
    brew install eza
    brew install fd
    brew install fzf
    brew install git-delta
    brew install ripgrep
    brew install tlrc
    brew install zoxide
elif [ `uname` = "Linux" ]; then
    # set proxy
    export http_proxy=http://192.168.119.1:1089 https_proxy=http://192.168.119.1:1089

    sudo apt-get install build-essential
    sudo apt-get install zsh
    sudo apt-get install bat
    sudo apt-get install fd-find
    sudo apt install fzf
    sudo apt-get install ripgrep

    /bin/bash -c "$(curl -sSf https://sh.rustup.rs)"
    cargo install eza
    cargo install git-delta
    cargo install zoxide --locked
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

# install zsh-vi-mode
git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-vi-mode

# install tmux conf
git clone --single-branch https://github.com/gpakosz/.tmux.git

# link .zshrc configuration
[ -e ".zshrc" ] && rm .zshrc
ln -s -f .dotfile/.zshrc

# link .ideavimrc
[ -e ".ideavimrc" ] && rm .ideavimrc
ln -s -f .dotfile/.ideavimrc

# link git configuration
[ -e ".gitconfig" ] && rm .gitconfig
ln -s -f .dotfile/.gitconfig

# link tmux configuration
[ -e ".tmux.conf" ] && rm .tmux.conf
ln -s -f .tmux/.tmux.conf
[ -e ".tmux.conf.local" ] && rm .tmux.conf.local
ln -s -f .dotfile/.tmux.conf.local

# fonts
git clone https://github.com/Karmenzind/monaco-nerd-fonts .dotfile/fonts/monaco-nerd-fonts

# install my vimrc
/bin/bash -c "$(curl -fsSL https://raw.github.com/ck89119/.vim/master/auto-install.sh)"
