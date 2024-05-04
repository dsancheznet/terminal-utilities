#!/bin/env bash

echo '  ___ ___ ___  _  _   ___ _  _ ___ _____ _   _    _    ___ ___'
echo ' |_ _/ __/ _ \| \| | |_ _| \| / __|_   _/_\ | |  | |  | __| _ \'
echo '  | | (_| (_) | .` |  | || .` \__ \ | |/ _ \| |__| |__| _||   /'
echo ' |___\___\___/|_|\_| |___|_|\_|___/ |_/_/ \_\____|____|___|_|_\'
echo ' Written by D.Sánchez 2024 '

git clone https://codeberg.org/daudix/adwaita-folder-icons.git

sudo cp ./adwaita-folder-icons/icons/*.svg /usr/share/icons/

rm -rf ./adwaita-folder-icons
