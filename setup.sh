#! /usr/bin/env bash

#Copy bash aliases
cp .bash_aliases /home/$SUDO_USER/
source /home/$SUDO_USER/.bashrc
echo 'Bash aliases updated succesfully'

#Install i3
apt install i3 pulseaudio-utils maim xclip xdotool
pip3 install --upgrade dmenu_extended
cp config /home/$SUDO_USER/.config/i3/
echo 'i3 has been installed and configured'

#Install Vim
apt install vim
echo 'Vim has been installed succesfully'

#Configure vim setup
cp .vimrc /home/$SUDO_USER/
if [! -d "/home/$SUDO_USER/.vim/bundle"]; then
    mkdir /home/$SUDO_USER/.vim/bundle
fi
cp ycm_extra_conf.py /home/$SUDO_USER/.vim/
sudo -u "$SUDO_USER"vim +PluginInstall +qall
apt install build-essential cmake vim-nox python3-dev mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm
cd /home/$SUDO_USER/.vim/bundle/YouCompleteMe
python3 install.py --all
echo 'Vim has been configured successfully'


