#!/bin/bash

# see omarchy/Install/packages.sh
sudo pacman -Rns --noconfirm 1password-beta
sudo pacman -Rns --noconfirm 1password-cli
sudo pacman -Rns --noconfirm kdenlive
sudo pacman -Rns --noconfirm libreoffice-fresh
sudo pacman -Rns --noconfirm localsend
sudo pacman -Rns --noconfirm mpv
sudo pacman -Rns --noconfirm obs-studio
sudo pacman -Rns --noconfirm obsidian
sudo pacman -Rns --noconfirm spotify
sudo pacman -Rns --noconfirm typora

# see omarchy/Install/packaging/webapps.sh
omarchy-webapp-remove \
    "Basecamp" \
    "Google Messages" \
    "X" \
    "Figma" \
    "Zoom"