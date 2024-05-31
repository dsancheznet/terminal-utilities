#!/bin/bash

echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo "┃ ████████╗██████╗ ███████╗ ┃"
echo "┃ ╚══██╔══╝██╔══██╗██╔════╝ ┃"
echo "┃    ██║   ██████╔╝███████╗ ┃"
echo "┃    ██║   ██╔══██╗╚════██║ ┃"
echo "┃    ██║   ██████╔╝███████║ ┃"
echo "┃    ╚═╝   ╚═════╝ ╚══════╝ ┃"
echo "┡━━━━━━━━━━━━━━━━━━━━━━━━━━━┩"
echo "│  DVB-Card driver install  │"
echo "│  Script by                │"
echo "│           D.Sánchez 2023  │"
echo "└───────────┈┈┈┈────────────┘ "

# Product: https://www.tbsdtv.com/products/tbs6522h-multi-standard-quad-tuner-pci-e-card.html
# Please consult https://linuxtv.org/wiki/index.php/TBS_driver_installation for details
# The current user has to have sudo privileges for this script wto work
# Start in our homedirectory
cd ~

# Install utilities and headers correspondig to actual kernel
sudo apt-get install patchutils libproc-processtable-perl linux-headers-$(uname -r)

# Install firmware
wget http://www.tbsdtv.com/download/document/linux/tbs-tuner-firmwares_v1.0.tar.bz2
sudo tar jxvf tbs-tuner-firmwares_v1.0.tar.bz2 -C /lib/firmware/

# Install TBS' forked media drivers
mkdir tbsdriver
cd tbsdriver
git clone https://github.com/tbsdtv/media_build.git
git clone --depth=1 https://github.com/tbsdtv/linux_media.git -b latest ./media
cd media_build
make dir DIR=../media
make allyesconfig
make -j4
sudo make install

# Remove downloaded source code
cd ~
rm -rf tbsdriver

# Reboot to activate the driver
sudo reboot
