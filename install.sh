#!/usr/bin/env bash
set -x

mkdir ~/.scripts
touch ~/.secrets
cp vim-update ~/.scripts/
cp tmux-attach.sh ~/.scripts/

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

cat _bashrc >> ~/.bashrc
cat _zshrc >> ~/.zshrc

cp _tmux.conf ~/.tmux.conf

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

mkdir -p ~/.config/
cp -R ./nvim_conf ~/.config/nvim
