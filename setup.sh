#!/bin/sh
if [ $(id -u) != 0 ];then
    echo "Please run as root."
    exit
fi
apt-get -y install git vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/powerline/fonts.git ./powerlinefont
./powerlinefont/install.sh

if [ -e "$HOME/.vimrc" ];then
    mv ~/.vimrc ~/.vimrc.backup
fi
cp ./vimrc ~/.vimrc
vim +PluginInstall +qall
apt-get install build-essential cmake python-dev
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
