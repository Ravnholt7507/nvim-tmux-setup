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

#Install Zoxide
apt install zoxide 
if [[ $? -eq 0 ]]; then
    echo 'Zoxide (z) has been installed succesfully'
else
    echo "Failed to install the Zoxide."
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

