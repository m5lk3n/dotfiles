#!/bin/bash

if [ "$EUID" -eq 0 ]; then
  echo "This is not intended to be run as root."
  exit 1
fi

if [ ! -f "~/.bashrc" ]; then
    echo "~/.bashrc does not exist."
    exit 1
fi
if [ ! -f "~/.config/hypr/hyprland.conf" ]; then
    echo "~/.config/hypr/hyprland.conf does not exist."
    exit 1
fi
if [ ! -d "~/.local/share/omarchy/default/hypr/apps/" ]; then
    echo "~/.local/share/omarchy/default/hypr/apps/ does not exist."
    exit 1
fi

read -p "This will overwrite configuration files! Only ~/.bashrc and ~/.config/hypr/hyprland.conf will be backed up. For more details, see https://github.com/m5lk3n/dotfiles/?tab=readme-ov-file#dotfiles. Continue? [y/N]: " confirm
if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 1
fi

# back up files before overwriting
TS=$(date +%Y%m%d-%H%M%S)
cp ~/.bashrc ~/.bashrc.bak-$TS
cp ~/.config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf.bak-$TS

# .bashrc
echo "" >> ~/.bashrc
echo "# from https://github.com/m5lk3n/dotfiles:" >> ~/.bashrc
echo "source ~/.spf" >> ~/.bashrc # superfile, see below
echo "source ~/.misc" >> ~/.bashrc

## dotfiles .bashrc additions
cp .spf ~/
cp .misc ~/

# install additional packages
## required for flutter: cmake, ninja, mesa-utils, android-studio
## required for superfile: exiftool
sudo pacman -Syu --noconfirm --needed \
    android-studio \
    cmake \
    exiftool \
    flutter \
    go \
    librewolf \
    mesa-utils \
    ncdu \
    ninja \
    superfile \
    visual-studio-code-bin

# superfile config
## https://superfile.netlify.app/configure/superfile-config/
SPF_CONFIG_DIR=.config/superfile
SPF_THEME_DIR=$SPF_CONFIG_DIR/theme
mkdir -p ~/$SPF_THEME_DIR
cp $SPF_CONFIG_DIR/config.toml ~/$SPF_CONFIG_DIR
cp $SPF_THEME_DIR/tokyonight.toml ~/$SPF_THEME_DIR

# dev setup
sudo usermod -a -G flutter $USER
flutter --disable-analytics
## tools requiring Go
go install heckel.io/pcopy@latest # "build at" info is missing
go install github.com/cheat/cheat/cmd/cheat@latest
CHEAT_CONFIG_DIR=.config/cheat/cheatsheets/personal
mkdir -p ~/$CHEAT_CONFIG_DIR
cp -r $CHEAT_CONFIG_DIR/* ~/$CHEAT_CONFIG_DIR

# Omarchy-specific overrides and additions
cp .config/alacritty/alacritty.toml ~/.config/alacritty
cp .local/share/omarchy/default/hypr/apps/jetbrains.conf ~/.local/share/omarchy/default/hypr/apps/
## desktop wallpaper
curl https://wallpaperbat.com/img/662354-arch-linux-wallpaper-top-free-arch-linux-background.jpg -o ~/.config/omarchy/themes/tokyo-night/backgrounds/4-archlinux.jpg
## no gaps
cp .config/hypr/*.conf ~/.config/hypr/
echo "source = ~/.config/hypr/looknfeel.conf" >> ~/.config/hypr/hyprland.conf