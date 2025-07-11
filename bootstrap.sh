#!/usr/bin/env bash
set -x

sudo apt install git tmux bat

shopt -s nullglob
files=(~/.ssh/id_*)
if (( ${#files[@]} )); then
    echo "At least one SSH private key exists."
else
    echo "No SSH private key found."
    read -p "Enter mail address: " address
    ssh-keygen -t rsa -b 4096 -C "$address"
fi

cd /tmp
rm -rf /tmp/simple_server_setup_ubuntu
git clone https://github.com/deliriusz/simple_server_setup_ubuntu.git

cd /tmp/simple_server_setup_ubuntu
chmod 755 install.sh
./install.sh
