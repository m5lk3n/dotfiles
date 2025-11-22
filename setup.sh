#!/bin/bash

if [ "$EUID" -eq 0 ]; then
  echo "This is not intended to be run as root."
  exit 1
fi

if [ ! -f "${HOME}/.bashrc" ]; then
    echo "${HOME}/.bashrc does not exist."
    exit 1
fi
if [ ! -d "${HOME}/.local/share/omarchy/default/hypr/apps/" ]; then
    echo "${HOME}/.local/share/omarchy/default/hypr/apps/ does not exist."
    exit 1
fi

read -p "This will overwrite configuration files! Only ~/.bashrc will be backed up. For more details, see https://github.com/m5lk3n/dotfiles/?tab=readme-ov-file#dotfiles. Continue? [y/N]: " confirm
if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 1
fi

# back up before overwriting
TS=$(date +%Y%m%d-%H%M%S)
cp "${HOME}/.bashrc" "${HOME}/.bashrc.bak-$TS"

# .bashrc
echo "" >> "${HOME}/.bashrc"
echo "# from https://github.com/m5lk3n/dotfiles:" >> "${HOME}/.bashrc"
echo "source ~/.spf" >> "${HOME}/.bashrc" # superfile, see below
echo "source ~/.misc" >> "${HOME}/.bashrc"

## dotfiles .bashrc additions
cp .spf "${HOME}"
cp .misc "${HOME}"

# install additional packages
## required for flutter: cmake, ninja, mesa-utils, android-studio
## required for superfile: exiftool
sudo pacman -Syu --noconfirm --needed \
    cmake \
    exiftool \
    go \
    mesa-utils \
    ncdu \
    ninja \
    superfile \
    visual-studio-code-bin

yay --noconfirm --answerclean All --answerdiff None -S librewolf-bin

# vscode
mkdir -p "${HOME}/.config/Code/User/"
cp .config/Code/User/settings.json "${HOME}/.config/Code/User/"

# superfile config
## https://superfile.netlify.app/configure/superfile-config/
SPF_CONFIG_DIR=.config/superfile
SPF_THEME_DIR=$SPF_CONFIG_DIR/theme
mkdir -p "${HOME}/$SPF_THEME_DIR"
cp $SPF_CONFIG_DIR/config.toml "${HOME}/$SPF_CONFIG_DIR"
cp $SPF_THEME_DIR/tokyonight.toml "${HOME}/$SPF_THEME_DIR"

# tools requiring Go
go install heckel.io/pcopy@latest # "build at" info is missing
go install github.com/cheat/cheat/cmd/cheat@latest
CHEAT_CONFIG_DIR=.config/cheat/cheatsheets/personal
mkdir -p "${HOME}/$CHEAT_CONFIG_DIR"
cp -r $CHEAT_CONFIG_DIR/* "${HOME}/$CHEAT_CONFIG_DIR"

# Omarchy-specific overrides and additions
cp .config/alacritty/alacritty.toml "${HOME}/.config/alacritty"
## desktop wallpaper
curl https://wallpaperbat.com/img/662354-arch-linux-wallpaper-top-free-arch-linux-background.jpg -o "${HOME}/.config/omarchy/themes/tokyo-night/backgrounds/4-archlinux.jpg"
## no gaps
cp .config/hypr/*.conf "${HOME}/.config/hypr/"