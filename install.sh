#!/bin/bash

# TODOs
# - check run as user, check for existence of .bashrc, .config/hypr/hyprland.conf
# - show warning, ask for confirmation to overwrite
# - [back up .bashrc, .config/hypr/hyprland.conf]

# Superfile
sudo pacman -S superfile exiftool
cp .spf ~/
echo "source .spf" >> ~/.bashrc
## https://superfile.netlify.app/configure/superfile-config/
SPF_CONFIG=~/.config/superfile/config.toml
sed -i "s/^theme = .*/theme = 'tokyonight'/" "$SPF_CONFIG"
sed -i "s/^cd_on_quit = .*/cd_on_quit = true/" "$SPF_CONFIG"
sed -i "s/^metadata = .*/metadata = true/" "$SPF_CONFIG"

# Go and tools requiring Go
mise go # sudo pacman -S go
go install heckel.io/pcopy@latest
go install github.com/cheat/cheat/cmd/cheat@latest
cp .config/cheat/* ~/.config/cheat/

# prepare Flutter installation
sudo pacman -S glu cmake ninja mesa-utils
## TODO: install Flutter and Android Studio

# TODO: install code

# misc
sudo pacman -S librewolf ncdu signal-desktop
cp .misc ~/
echo "source .misc" >> ~/.bashrc

# configure
## desktop wallpaper
wget https://wallpaperbat.com/img/662354-arch-linux-wallpaper-top-free-arch-linux-background.jpg -O ~/.config/omarchy/themes/tokyo-night/backgrounds/4-archlinux.jpg
## no gaps
echo "source = ~/.config/hypr/looknfeel.conf" >> ~/.config/hypr/hyprland.conf
cp .config/hypr/*.conf ~/.config/hypr/