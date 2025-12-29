#!/bin/bash

echo "Install script for a local..."
echo "▄▄   ▄▄ ▄▄▄▄▄ ▄▄▄▄  ▄▄  ▄▄▄   ▄▄▄▄ ▄▄▄▄▄ ▄▄▄▄  ▄▄ ▄▄ ▄▄▄▄▄ ▄▄▄▄  "
echo "██▀▄▀██ ██▄▄  ██▀██ ██ ██▀██ ███▄▄ ██▄▄  ██▄█▄ ██▄██ ██▄▄  ██▄█▄ "
echo "██   ██ ██▄▄▄ ████▀ ██ ██▀██ ▄▄██▀ ██▄▄▄ ██ ██  ▀█▀  ██▄▄▄ ██ ██ "                                                                 
echo "                                       Written by D.Sánchez 2023 "

# Script to install a TVHeadend + Jellyfin Mediaserver from a Debian "Trixie" barebone installation ( no X )

# Install required packets ( updated: DEC2025 )
sudo apt install wget sudo ethtool hdparm mc python3-neovim curl neomutt unrar unzip unace git gcc g++ make patchutils libproc-processtable-perl linux-headers-`uname -r` firmware-linux-nonfree vim-youcompleteme vim-snippets vim-scripts vim-minimap vim-link-vim vim-airline vim-airline-themes vim-addon-manager duf eza 

# Install

# Install tvheadend ( will be available on port 9981 once rebooted )
echo "Installing TVHEADEND repo"
curl -1sLf 'https://dl.cloudsmith.io/public/tvheadend/tvheadend/setup.deb.sh'   | sudo -E bash

# Install Jellyfin ( will be available on port 8096 once rebooted )
echo "Installing JELLYFIN repo"
curl https://repo.jellyfin.org/install-debuntu.sh | sudo bash

# Install packets from repos
echo "Installing packets"
sudo apt install tvheadend

# Install TBS Drivers
echo "Installing and compiling tbs drivers"
curl "https://raw.githubusercontent.com/dsancheznet/terminal-utilities/refs/heads/main/install_tbs_drivers.sh" | bash
