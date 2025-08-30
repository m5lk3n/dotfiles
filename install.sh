#!/bin/bash

# TODOs
# - check run as user, check for existence of .bashrc, .config/hypr/hyprland.conf
# - show warning, ask for confirmation to overwrite
# - [back up .bashrc, .config/hypr/hyprland.conf]

# Superfile
sudo pacman -Syu --noconfirm --needed superfile exiftool
cp .spf ~/
echo "source .spf" >> ~/.bashrc
## https://superfile.netlify.app/configure/superfile-config/
SPF_CONFIG_DIR=.config/superfile
SPF_THEME_DIR=$SPF_CONFIG_DIR/theme
mkdir -p ~/$SPF_THEME_DIR
cp $SPF_CONFIG_DIR/config.toml ~/$SPF_CONFIG_DIR
cp $SPF_THEME_DIR/tokyonight.toml ~/$SPF_THEME_DIR

# Go and tools requiring Go
mise go # sudo pacman -Syu --noconfirm --needed go
go install heckel.io/pcopy@latest
go install github.com/cheat/cheat/cmd/cheat@latest
cp .config/cheat/* ~/.config/cheat/

# prepare Flutter installation
sudo pacman -Syu --noconfirm --needed glu cmake ninja mesa-utils
## TODO: install Flutter and Android Studio

# TODO: install code

# miscs
sudo pacman -Syu --noconfirm --needed librewolf ncdu signal-desktop
cp .misc ~/
echo "source .misc" >> ~/.bashrc

# configure
## desktop wallpaper
wget https://wallpaperbat.com/img/662354-arch-linux-wallpaper-top-free-arch-linux-background.jpg -O ~/.config/omarchy/themes/tokyo-night/backgrounds/4-archlinux.jpg
## no gaps
echo "source = ~/.config/hypr/looknfeel.conf" >> ~/.config/hypr/hyprland.conf
cp .config/hypr/*.conf ~/.config/hypr/