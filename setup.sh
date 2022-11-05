#!/bin/bash

sudo=""

if [[ $(id -u) != 0 ]];then
    sudo="sudo"
fi

$sudo apt-get update
$sudo apt-get install -y git vim

if [[ -d ~/.vim ]]; then
    mv ~/.vim ~/.vim.backup
fi
if [[ -f ~/.vimrc ]]; then
    mv ~/.vimrc ~/.vimrc.backup
fi

git clone https://github.com/jackyliuxx/.vim.git

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall

# install YouCompleteMe
$sudo apt-get install -y build-essential cmake vim-nox python3-dev
$sudo apt-get install -y mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm
cd ~/.vim/plugged/YouCompleteMe
python3 install.py --all
