#!/usr/bin/env bash
set -x

mkdir -p ~/.scripts
touch ~/.secrets
chmod 600 ~/.secrets
cp vim-update ~/.scripts/
cp tmux-attach.sh ~/.scripts/

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

cat _bashrc >> ~/.bashrc
cat _zshrc >> ~/.zshrc
cat _commonrc > ~/.commonrc

cp _tmux.conf ~/.tmux.conf

mkdir -p ~/.config/
cp -R ./nvim_conf ~/.config/nvim

# Interactive questions
echo ""
echo "=== Additional Setup Options ==="

# Question 1: Nvim install and vim-update
read -p "Do you want to run nvim install and vim-update script? (y/n): " nvim_choice
if [[ $nvim_choice =~ ^[Yy]$ ]]; then
    echo "Running nvim install and vim-update..."
    ~/.scripts/vim-update
    echo "Nvim setup completed!"
else
    echo "Skipping nvim install and vim-update. Installing vim with Vundle..."
    # Vim setup with Vundle
    mkdir ~/.vim ; mkdir ~/.vim/bundle && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    cp _vimrc ~/.vimrc
fi

# Question 2: Node exporter
read -p "Do you want to install node_exporter? (y/n): " node_choice
if [[ $node_choice =~ ^[Yy]$ ]]; then
    echo "Installing node_exporter..."
    chmod +x ./install_node_exporter.sh

    read -p "Enter the port for node_exporter: " port
    ./install_node_exporter.sh $port
    echo "Node exporter installation completed!"
else
    echo "Skipping node_exporter installation."
fi

echo ""
echo "=== Setup Complete ==="
