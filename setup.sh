#!/bin/sh

sudo=""

if [ $(id -u) != 0 ];then
    sudo="sudo"
fi

cd ~/.vim
$sudo apt-get -y install git vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

if [ -e "$HOME/.vimrc" ];then
    mv ~/.vimrc ~/.vimrc.backup
fi
cp ./vimrc ~/.vimrc
vim +PluginInstall +qall
$sudo apt-get install build-essential cmake python-dev
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
