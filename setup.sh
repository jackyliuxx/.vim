#!/bin/sh
if [ -e "/usr/bin/git" ];then
    echo 'found git!'
else
    sudo apt-get -y install git
fi
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/powerline/fonts.git ./powerlinefont
./powerlinefont/install.sh

if [ -e "$HOME/.vimrc" ];then
    mv ~/.vimrc ~/.vimrc.backup
fi
cp ./vimrc ~/.vimrc
