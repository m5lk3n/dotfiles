#!/bin/bash

# see https://github.com/basecamp/omarchy/blob/master/install/omarchy-base.packages
sudo pacman -Rns --noconfirm 1password-beta
sudo pacman -Rns --noconfirm 1password-cli
sudo pacman -Rns --noconfirm kdenlive
sudo pacman -Rns --noconfirm libreoffice-fresh
sudo pacman -Rns --noconfirm localsend
sudo pacman -Rns --noconfirm mpv
sudo pacman -Rns --noconfirm obs-studio
sudo pacman -Rns --noconfirm obsidian
sudo pacman -Rns --noconfirm pinta
sudo pacman -Rns --noconfirm spotify
sudo pacman -Rns --noconfirm typora
sudo pacman -Rns --noconfirm xournalpp

# see https://github.com/basecamp/omarchy/blob/master/install/packaging/webapps.sh
omarchy-webapp-remove \
    "Basecamp" \
    "Figma" \
    "Google Messages" \
    "X" \
    "Zoom"

## default install config left-overs
rm -rf ~/.config/libreoffice
rm -rf ~/.config/xournalpp
rm -rf ~/.config/Typora
rm -rf ~/.local/share/omarchy/config/Typora
rm -rf ~/.local/share/omarchy/applications/typora.desktop
rm -rf ~/.local/share/applications/typora.desktop
rm -rf ~/.local/share/applications/dropbox.desktop
