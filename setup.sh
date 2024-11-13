#! /usr/bin/env bash

#Copy bash aliases
cp .bash_aliases ~/
source ~/.bashrc
echo 'Bash aliases updated succesfully'

#Install i3
apt install i3 pulseaudio-utils maim xclip xdotool
pip3 install --upgrade dmenu_extended
cp config ~/.config/i3/
echo 'i3 has been installed and configured'

#Install Vim
apt install vim
echo 'Vim has been installed succesfully'

#Configure vim setup
cp .vimrc ~/
if [! -d "~/.vim/bundle"]; then
    mkdir ~/.vim/bundle
fi
vim +PluginInstall +qall
apt install build-essential cmake vim-nox python3-dev mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
echo 'Vim has been configured successfully'


