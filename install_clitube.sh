#!/bin/env bash

echo "clitube Installer Written by D.Sánchez 2024."
echo
echo -e "\e[1;33mAttention\e[0m: This script requires admin privileges."
echo -e "Please do \e[1;32mNOT\e[0m trust me. Check the contents of the script before executing!"

DONEMSG=""

read -s -p "Please provide your sudo password (will not be echoed): " PASSWORD
echo

if [[ -d /usr/local/bin/ ]]; then 
    echo -n "Checking for /usr/local/bin/      "
    echo -e "[\e[1;32mOK\e[0m]"
else 
    echo -e "[\e[1;31mFAIL\e[0m]"; 
    echo -n "Creating directory                "
    sudo mkdir -p /usr/local/bin/
    echo -e "[\e[1;32mOK\e[0m]"
    DONEMSG+="Please verify that your PATH includes /usr/local/bin/.\n"
fi

echo -n "Downloading clitube from repo     "
echo $PASSWORD | sudo -S wget --quiet "https://raw.githubusercontent.com/dsancheznet/terminal-utilities/main/clitube" -P /usr/local/bin/
echo -e "[\e[1;32mOK\e[0m]"

echo -n "Changing script to ececutable     "
echo $PASSWORD | sudo -S chmod +x /usr/local/bin/clitube
echo -e "[\e[1;32mOK\e[0m]"

echo -n "Downloading clitube from repo     "
wget --quiet "https://raw.githubusercontent.com/dsancheznet/terminal-utilities/main/.clituberc" -P /home/"$USER"/
echo -e "[\e[1;32mOK\e[0m]"

VLCPATH=`which nvlc`
KEWPATH=`which kew`
FFMPATH=`which ffplay`

echo -n "nvlc player                       "
if [ -n "$VLCPATH" ]; then
    echo -e "[\e[1;32mOK\e[0m] $VLCPATH"
else
    echo -e "[\e[1;31mFAIL\e[0m]"
    DONEMSG+="NVLC was not found. Either install it or adjust your .clituberci\n"
fi

echo -n "kew player                        "
if [ -n "$KEWPATH" ]; then
    echo -e "[\e[1;32mOK\e[0m] $KEWPATH"
else
    echo -e "[\e[1;31mFAIL\e[0m]"
    DONEMSG+="KEW was not found. Either install it or adjust your .clituberc\n"
fi

echo -n "ffplayer player                   "
if [ -n "$FFMPATH" ]; then
    echo -e "[\e[1;32mOK\e[0m] $FFMPATH"
else
    echo -e "[\e[1;31mFAIL\e[0m]"
    DONEMSG+="FFPLAY was not found. Either install it or adjust your .clituberc\n"
fi

echo -e "$DONEMSG"

echo "Now enjoy clitube."

