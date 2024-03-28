#!/bin/bash

echo " _____ _____ _____ _____    _____ _____ _____ _____ _____ __    __    _____ _____"
echo "|   __|     |   | |_   _|  |     |   | |   __|_   _|  _  |  |  |  |  |   __| __  |"
echo "|   __|  |  | | | | | |    |-   -| | | |__   | | | |     |  |__|  |__|   __|    -|"
echo "|__|  |_____|_|___| |_|    |_____|_|___|_____| |_| |__|__|_____|_____|_____|__|__|"
echo " Written by D.Sánchez 2023."

# Create font and temporary directory
mkdir -p ~/.local/share/fonts/
mkdir ./tmp

# Change to directory
cd tmp

# Download section
wget --no-check-certificate "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/EnvyCodeR.zip"
wget --no-check-certificate "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraMono.zip"
wget --no-check-certificate "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Iosevka.zip"
wget --no-check-certificate "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/IosevkaTerm.zip"
wget --no-check-certificate "https://use.fontawesome.com/releases/v6.4.0/fontawesome-free-6.4.0-desktop.zip"
wget --no-check-certificate --directory-prefix=~/.local/share/fonts/ "https://github.com/AppleDesignResources/SanFranciscoFont/raw/master/SanFranciscoDisplay-Black.otf"
wget --no-check-certificate --directory-prefix=~/.local/share/fonts/ "https://github.com/AppleDesignResources/SanFranciscoFont/raw/master/SanFranciscoDisplay-Bold.otf"
wget --no-check-certificate --directory-prefix=~/.local/share/fonts/ "https://github.com/AppleDesignResources/SanFranciscoFont/raw/master/SanFranciscoDisplay-Heavy.otf"
wget --no-check-certificate --directory-prefix=~/.local/share/fonts/ "https://github.com/AppleDesignResources/SanFranciscoFont/raw/master/SanFranciscoDisplay-Light.otf"
wget --no-check-certificate --directory-prefix=~/.local/share/fonts/ "https://github.com/AppleDesignResources/SanFranciscoFont/raw/master/SanFranciscoDisplay-Medium.otf"
wget --no-check-certificate --directory-prefix=~/.local/share/fonts/ "https://github.com/AppleDesignResources/SanFranciscoFont/raw/master/SanFranciscoDisplay-Regular.otf"
wget --no-check-certificate --directory-prefix=~/.local/share/fonts/ "https://github.com/AppleDesignResources/SanFranciscoFont/raw/master/SanFranciscoDisplay-Semibold.otf"
wget --no-check-certificate --directory-prefix=~/.local/share/fonts/ "https://github.com/AppleDesignResources/SanFranciscoFont/raw/master/SanFranciscoDisplay-Thin.otf"
wget --no-check-certificate --directory-prefix=~/.local/share/fonts/ "https://github.com/AppleDesignResources/SanFranciscoFont/raw/master/SanFranciscoDisplay-Ultralight.otf"
wget --no-check-certificate --directory-prefix=~/.local/share/fonts/ "https://github.com/AppleDesignResources/SanFranciscoFont/raw/master/SanFranciscoText-Bold.otf"
wget --no-check-certificate --directory-prefix=~/.local/share/fonts/ "https://github.com/AppleDesignResources/SanFranciscoFont/raw/master/SanFranciscoText-BoldItalic.otf"
wget --no-check-certificate --directory-prefix=~/.local/share/fonts/ "https://github.com/AppleDesignResources/SanFranciscoFont/raw/master/SanFranciscoText-Heavy.otf"
wget --no-check-certificate --directory-prefix=~/.local/share/fonts/ "https://github.com/AppleDesignResources/SanFranciscoFont/raw/master/SanFranciscoText-HeavyItalic.otf"
wget --no-check-certificate --directory-prefix=~/.local/share/fonts/ "https://github.com/AppleDesignResources/SanFranciscoFont/raw/master/SanFranciscoText-Light.otf"
wget --no-check-certificate --directory-prefix=~/.local/share/fonts/ "https://github.com/AppleDesignResources/SanFranciscoFont/raw/master/SanFranciscoText-LightItalic.otf"
wget --no-check-certificate --directory-prefix=~/.local/share/fonts/ "https://github.com/AppleDesignResources/SanFranciscoFont/raw/master/SanFranciscoText-Medium.otf"
wget --no-check-certificate --directory-prefix=~/.local/share/fonts/ "https://github.com/AppleDesignResources/SanFranciscoFont/raw/master/SanFranciscoText-MediumItalic.otf"
wget --no-check-certificate --directory-prefix=~/.local/share/fonts/ "https://github.com/AppleDesignResources/SanFranciscoFont/raw/master/SanFranciscoText-Regular.otf"
wget --no-check-certificate --directory-prefix=~/.local/share/fonts/ "https://github.com/AppleDesignResources/SanFranciscoFont/raw/master/SanFranciscoText-RegularItalic.otf"
wget --no-check-certificate --directory-prefix=~/.local/share/fonts/ "https://github.com/AppleDesignResources/SanFranciscoFont/raw/master/SanFranciscoText-Semibold.otf"
wget --no-check-certificate --directory-prefix=~/.local/share/fonts/ "https://github.com/AppleDesignResources/SanFranciscoFont/raw/master/SanFranciscoText-SemiboldItalic.otf"

# Extract all otf and ttf files to local font directory
for F in *.zip; do unzip $F "*.[oOtT][tT][fF]" -d ~/.local/share/fonts/; rm $F; done

# Exit temporary directory
cd ..

# Remove temporary directory
rm -rf ./tmp

#Install fonts
fc-cache -f -v
