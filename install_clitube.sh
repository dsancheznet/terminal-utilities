#!/bin/env bash

# Print header
echo "clitube Installer Written by D.Sánchez 2024."
echo
echo -e "\e[1;33mAttention\e[0m: This script requires admin privileges."
echo -e "Please do \e[1;32mNOT\e[0m trust me. Check the contents of the script before executing!"

# Prepare variables
DONEMSG=""
# Check mandatory tools
WGETPATH=`which wget`
WHIPTAILPATH=`which whiptail`
YTDLPPATH=`which yt-dlp`
JQPATH=`which jq`
# Check for optional tools
VLCPATH=`which nvlc`
KEWPATH=`which kew`
FFMPATH=`which ffplay`

# Check if dependecies are met. The lack of any of them will abort installation.
echo -n "Checking for wget                 "
if [ -n "$WGETPATH" ]; then
    echo -e "[\e[1;32mOK\e[0m] $WGETPATH"
else
    echo -e "[\e[1;31mFAIL\e[0m]"
    echo "wget not found. Please install WGET and re-run the installer. Aborting..."
    exit 1
fi

echo -n "Checking for whiptail             "
if [ -n "$WHIPTAILPATH" ]; then
    echo -e "[\e[1;32mOK\e[0m] $WHIPTAILPATH"
else
    echo -e "[\e[1;31mFAIL\e[0m]"
    echo "Whiptail not found. Please install JQ and re-run the installer. Aborting..."
    exit 1
fi

echo -n "Checking for ytdlp                "
if [ -n "$YTDLPPATH" ]; then
    echo -e "[\e[1;32mOK\e[0m] $YTDLPPATH"
else
    echo -e "[\e[1;31mFAIL\e[0m]"
    echo "yt-dlp not found. Please install YT-DLP and re-run the installer. Aborting..."
    exit 1
fi

echo -n "Checking for jq                   "
if [ -n "$JQPATH" ]; then
    echo -e "[\e[1;32mOK\e[0m] $JQPATH"
else
    echo -e "[\e[1;31mFAIL\e[0m]"
    echo "jq not found. Please install JQ and re-run the installer. Aborting..."
    exit 1
fi

# Ask user for sudo password
read -s -p "Please provide your sudo password (will not be echoed): " PASSWORD
echo

# Check directory structure
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

# Download main script
echo -n "Downloading clitube from repo     "
echo $PASSWORD | sudo -S wget --quiet "https://raw.githubusercontent.com/dsancheznet/terminal-utilities/main/clitube" -P /usr/local/bin/
echo -e "[\e[1;32mOK\e[0m]"


# Make it executable
echo -n "Changing script to ececutable     "
echo $PASSWORD | sudo -S chmod +x /usr/local/bin/clitube
echo -e "[\e[1;32mOK\e[0m]"


# Download configuration file
echo -n "Downloading clitube from repo     "
wget --quiet "https://raw.githubusercontent.com/dsancheznet/terminal-utilities/main/.clituberc" -P /home/"$USER"/
echo -e "[\e[1;32mOK\e[0m]"

# Inform user of optional tools. A lack of any of them will NOT abort the script, but inform the user.
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

echo "Enjoy clitube."
