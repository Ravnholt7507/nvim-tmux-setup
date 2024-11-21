#! /usr/bin/env bash

#Intall ranger
apt install ranger

#Install Zoxide
apt install zoxide

#Install Vim
apt install vim
echo 'Vim has been installed succesfully'

#Install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit -D -t /usr/local/bin/

#Copy bash aliases
cp .bash_aliases /home/$SUDO_USER/
cp .bashrc /home/$SUDO_USER/
. /home/$SUDO_USER/.bashrc
echo 'Bash aliases updated succesfully'

#Configure vim setup
cp .vimrc /home/$SUDO_USER/
if [ ! -d "/home/$SUDO_USER/.vim/bundle"]; then
    mkdir /home/$SUDO_USER/.vim/bundle
fi
cp ycm_extra_conf.py /home/$SUDO_USER/.vim/
sudo -u "$SUDO_USER" vim +PluginInstall +qall
apt install build-essential cmake vim-nox python3-dev mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm
cd /home/$SUDO_USER/.vim/bundle/YouCompleteMe
sudo -u "$SUDO_USER" python3 install.py --all
echo 'Vim has been configured successfully'
