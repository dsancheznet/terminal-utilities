#!/bin/bash

echo "Install script for a..."
echo "                    _ _ "
echo "                   | (_)"
echo " _ __ ___   ___  __| |_  __ _ ___  ___ _ ____   _____ _ __ "
echo "| '_ ` _ \ / _ \/ _` | |/ _` / __|/ _ \ '__\ \ / / _ \ '__|"
echo "| | | | | |  __/ (_| | | (_| \__ \  __/ |   \ V /  __/ | "  
echo "|_| |_| |_|\___|\__,_|_|\__,_|___/\___|_|    \_/ \___|_| "
echo "Written by D.Sánchez 2023"

# Script to install a TVHeadend + Jellyfin Mediaserver from a Debian "Bookworm" barebone installation ( no X )
# This script has to be executed as root.

# Install required packets
apt install wget sudo ethtool hdparm mc python3-neovim curl neomutt unrar unzip unace git gcc g++ make patchutils libproc-processtable-perl linux-headers-`uname -r` firmware-linux-nonfree firmware-linux-misc fuse3

# Install tvheadend ( will be available on port 9981 once rebooted )
curl -1sLf   'https://dl.cloudsmith.io/public/tvheadend/tvheadend/setup.deb.sh'   | sudo -E bash

# Install Jellyfin ( will be available on port 8096 once rebooted )
curl https://repo.jellyfin.org/install-debuntu.sh | sudo bash

# Install recent neovim release
wget "https://github.com/neovim/neovim/releases/download/v0.9.1/nvim.appimage"
chmod ugo+x ./nvim.appimage
mv ./nvim.appimage /usr/local/bin/nvim
