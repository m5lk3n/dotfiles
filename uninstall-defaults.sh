#!/bin/bash

# see omarchy/Install/packages.sh
sudo pacman -Rns --noconfirm --needed \
    1password-beta \
    1password-cli \
    kdenlive \
    libreoffice-fresh \
    localsend \
    mpv \
    obs-studio \
    obsidian \
    spotify \
    typora

# see omarchy/Install/packaging/webapps.sh
omarchy-webapp-remove \
    "Basecamp" \
    "Google Messages" \
    "X" \
    "Figma" \
    "Zoom"