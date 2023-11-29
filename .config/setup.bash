#! /bin/bash

alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
config submodule init
config submodule update
ln -sT $HOME/.config/nvim.user nvim/lua/user
sudo pacman -Syu
sudo pacman -S --needed git base-devel
mkdir -p $HOME/Programs/
cd $HOME/Programs
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S hyprland-nvidia \
  waybar-hyprland \
  neovim \
  ttf-jetbrains-mono-nerd \
  fish \
  tofi \
  hyprpaper \
  kitty \
  playerctl \
  wireplumber \
  wl-clipboard \
  nautilus \
  firefox \
  spotify \
  blueberry \
  bluez \
  nvidia-dkms \
  pipewire-audio \
  pipewire-jack \
  networkmanager \
  pipewire-pulse \
  pipewire-alsa \
  btop \
  eza 


systemctl enable NetworkManager
systemctl start NetworkManager
systemctl enable bluetooth


  
