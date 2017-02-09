#!/bin/sh

cd ~

# clone repository
[ -e ".dotfile" ] && rm -rf .dotfile
git clone https://github.com/ck89119/.dotfile.git .dotfile

# install
cd .dotfile
./install.sh
