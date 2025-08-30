#!/bin/bash

if [ "$EUID" -eq 0 ]; then
  echo "Please do not run as root."
  exit 1
fi

if [ ! -f "$HOME/.bashrc" ]; then
    echo "$HOME/.bashrc does not exist."
    exit 1
fi

if [ ! -f "$HOME/.config/hypr/hyprland.conf" ]; then
    echo "$HOME/.config/hypr/hyprland.conf does not exist."
    exit 1
fi

read -p "This will overwrite ~/.bashrc and ~/.config/hypr/hyprland.conf. Both files will be backed up. Continue? [y/N]: " confirm
if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 1
fi

# back up files before overwriting
TS=$(date +%Y%m%d-%H%M%S)
cp ~/.bashrc ~/.bashrc.bak-$TS
cp ~/.config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf.bak-$TS

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
sudo pacman -Syu --noconfirm --needed go
go install heckel.io/pcopy@latest # "build at" info is missing
go install github.com/cheat/cheat/cmd/cheat@latest
CHEAT_CONFIG_DIR=.config/cheat/cheatsheets/personal
mkdir -p ~/$CHEAT_CONFIG_DIR
cp -r $CHEAT_CONFIG_DIR/* ~/$CHEAT_CONFIG_DIR

# prepare Flutter installation
sudo pacman -Syu --noconfirm --needed cmake ninja mesa-utils flutter
sudo usermod -a -G flutter $USER
flutter --disable-analytics

## TODO: install Android Studio

## TODO: install code

# misc
sudo pacman -Syu --noconfirm --needed librewolf ncdu
librewolf --setDefaultBrowser --version
cp .misc ~/
echo "source .misc" >> ~/.bashrc

rm -rf ~/.config/libreoffice
rm -rf ~/.config/Typora
rm -rf ~/.local/share/omarchy/config/Typora
rm -rf ~/.local/share/omarchy/applications/typora.desktop

# configure
## desktop wallpaper
curl https://wallpaperbat.com/img/662354-arch-linux-wallpaper-top-free-arch-linux-background.jpg -o ~/.config/omarchy/themes/tokyo-night/backgrounds/4-archlinux.jpg
## no gaps
cp .config/hypr/*.conf ~/.config/hypr/
echo "source = ~/.config/hypr/looknfeel.conf" >> ~/.config/hypr/hyprland.conf