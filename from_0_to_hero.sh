#!/bin/bash

# BSPWM Installtion Script Written by D.Sánchez

sudo apt update && sudo apt upgrade -y
sudo apt install picom nitrogen bspwm sxhkd polybar dunst unzip unrar-free plymouth plymouth-theme-breeze plymouth-themes desktop-base xinit terminator python3-virtualenv python3-venv flatpak mlocate psmisc gnupg git yt-dlp lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings imagemagick pulseaudio alsa-utils maim
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install firefox
flatpak install flatseal
mkdir -p ~/.config/bspwm
mkdir -p ~/.config/sxhkd
mkdir -p ~/.config/polybar
cp /usr/share/doc/polybar/examples/config.ini ~/.config/polybar/
cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
cp /usr/share/doc/sxhkd/examples/background_shell/sxhkdrc ~/.config/sxhkd/
gpg --keyserver keyserver.ubuntu.com --recv 0xfaf1020699503176
gpg --export 0xfaf1020699503176 | sudo tee /usr/share/keyrings/ulauncher-archive-keyring.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/ulauncher-archive-keyring.gpg] \
          http://ppa.launchpad.net/agornostal/ulauncher/ubuntu jammy main"           | sudo tee /etc/apt/sources.list.d/ulauncher-jammy.list
sudo apt update
sudo apt install ulauncher
polybar -c ~/.config/polybar/config.ini
sudo apt install lightdm-autologin-greeter lightdm-settings lightdm-gtk-greeter-settings 
wget "https://github.com/neovim/neovim/releases/download/v0.9.1/nvim.appimage"
chmod +x nvim.appimage 
sudo mv nvim.appimage /usr/local/bin/nvim 
./font_installer.sh 
sudo updatedb
