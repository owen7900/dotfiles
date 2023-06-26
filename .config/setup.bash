#! /bin/bash

sudo add-apt-repository -y ppa:regolith-linux/release
sudo apt update
sudo apt upgrade -y

sudo apt install -y i3-gaps-wm  i3-next-workspace fish
mkdir -p $HOME/bin/
curl https://github.com/neovim/neovim/releases/download/stable/nvim.appimage > $HOME/bin/nvim
chmod u+x $HOME/bin/nvim
