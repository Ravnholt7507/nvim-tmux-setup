#! /usr/bin/env bash

if [[ "$EUID" -ne 0 ]]; then
    echo "Please run this script as root (using sudo)."
    exit 1
fi

#Update apt repo
apt update 

#Install Tldr
snap install tldr
if [[ $? -eq 0 ]]; then
    echo 'Tldr has been installed succesfully'
else
    echo "Failed to install the Tldr."
    exit 1
fi

#Install Ranger
apt install ranger
if [[ $? -eq 0 ]]; then
    echo 'Ranger has been installed succesfully'
else
    echo "Failed to install the Ranger."
    exit 1
fi

#Install Zoxide
apt install zoxide 
if [[ $? -eq 0 ]]; then
    echo 'Zoxide (z) has been installed succesfully'
else
    echo "Failed to install the Zoxide."
    exit 1
fi

#Install Vim
apt install vim 
if [[ $? -eq 0 ]]; then
    echo 'Vim has been installed succesfully'
else
    echo "Failed to install the Vim."
    exit 1
fi

#Install Lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*') 
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" 
tar xf lazygit.tar.gz lazygit 
install lazygit -D -t /usr/local/bin/ 
rm lazygit.tar.gz 
rm lazygit 
if [[ $? -eq 0 ]]; then
    echo 'Lazygit has been installed'
else
    echo "Failed to install the Lazygit."
    exit 1
fi

#Copy bash aliases
cp .bash_aliases /home/$SUDO_USER/ 
cp .bashrc /home/$SUDO_USER/ 
. /home/$SUDO_USER/.bashrc 
if [[ $? -eq 0 ]]; then
    echo 'Bash aliases updated succesfully'
else
    echo "Failed to install the Bash."
    exit 1
fi

#Configure vim setup
cp .vimrc /home/$SUDO_USER/ 
if [ ! -d "/home/$SUDO_USER/.vim/bundle" ]; then
    mkdir /home/$SUDO_USER/.vim/bundle 
fi
cp ycm_extra_conf.py /home/$SUDO_USER/.vim/ 
sudo -u "$SUDO_USER" vim +PluginInstall +qall 
apt install build-essential cmake vim-nox python3-dev mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm 
cd /home/$SUDO_USER/.vim/bundle/YouCompleteMe 
sudo -u "$SUDO_USER" python3 install.py --all 
if [[ $? -eq 0 ]]; then
    echo 'Vim has been configured successfully'
else
    echo "Failed to configure Vim."
    exit 1
fi
