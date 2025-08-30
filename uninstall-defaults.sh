#!/bin/bash

# see omarchy/install/packages.sh
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
sudo pacman -Rns --noconfirm xournalpp

# see omarchy/install/packaging/webapps.sh
omarchy-webapp-remove \
    "Basecamp" \
    "Figma" \
    "Google Messages" \
    "X" \
    "Zoom"