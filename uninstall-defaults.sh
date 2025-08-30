#!/bin/bash

# see omarchy/Install/packages.sh
sudo pacman -Rns \
    1password-beta \
    1password-cli \
    dropbox \
    kdenlive \
    libreoffice \
    localsend \
    mpv \
    obs-studio \
    obsidian \
    spotify \
    typora

# see omarchy/Install/packaging/webapps.sh
bin/omarchy-webapp-remove \
    "Basecamp" \
    "Google Messages" \
    "X" \
    "Figma" \
    "Zoom"