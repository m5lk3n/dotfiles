#!/bin/bash

if [ "$EUID" -eq 0 ]; then
  echo "This is not intended to be run as root."
  exit 1
fi
if [ ! -f "${HOME}/.config/DankMaterialShell/settings.json" ]; then
    echo "Dank Linux must be installed, please see https://github.com/m5lk3n/dotfiles/#prerequisites."
    exit 1
fi
if [ ! -f "${HOME}/.bashrc" ]; then
    echo "${HOME}/.bashrc does not exist."
    exit 1
fi

read -p "This will overwrite configuration files! Only ~/.bashrc will be backed up. For more details, please see https://github.com/m5lk3n/dotfiles/. Continue? [y/N]: " confirm
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
echo "eval \"\$(starship init bash)\"" >> "${HOME}/.bashrc" # prompt
echo "source ~/.spf" >> "${HOME}/.bashrc" # superfile, see below
echo "source ~/.misc" >> "${HOME}/.bashrc"

## dotfiles .bashrc additions
cp .spf "${HOME}"
cp .misc "${HOME}"

# install additional packages
sudo pacman -Syu --noconfirm --needed \
    base-devel \
    code \
    curl \
    evince \
    exiftool \
    eza \
    gimp \
    git \
    glow \
    go \
    ncdu \
    superfile \
    tailscale \
    usbutils

# install yay and LibreWolf via AUR
if ! command -v yay &> /dev/null; then
    echo "yay not found, installing..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    (cd /tmp/yay && makepkg -si --noconfirm)
    rm -rf /tmp/yay
else
    echo "yay already installed, skipping."
fi

yay --noconfirm --answerclean All --answerdiff None -S librewolf-bin

# VS Code config
CODE_CONFIG_DIR=".config/Code - OSS/User"
mkdir -p "${HOME}/${CODE_CONFIG_DIR}"
cp "${CODE_CONFIG_DIR}/settings.json" "${HOME}/${CODE_CONFIG_DIR}"

# Superfile config
## https://superfile.netlify.app/configure/superfile-config/
# TODO: in .config/superfile/config.toml, set 
#   editor = "vim"
#   dir_editor = "vim"
#   cd_on_exit = true
#   theme = "0x96f"
#   metadata = false

# tools requiring Go
go install heckel.io/pcopy@latest # "build at" info is missing
go install github.com/cheat/cheat/cmd/cheat@latest
CHEAT_CONFIG_DIR=.config/cheat/cheatsheets/personal
mkdir -p "${HOME}/$CHEAT_CONFIG_DIR"
cp -r $CHEAT_CONFIG_DIR/* "${HOME}/$CHEAT_CONFIG_DIR"

## desktop wallpaper
curl https://wallpaperbat.com/img/662354-arch-linux-wallpaper-top-free-arch-linux-background.jpg -o "${HOME}/Pictures/archlinux.jpg"
# TODO: in .local/state/DankMaterialShell/session.json, set "wallpaperPath" to "${HOME}/Pictures/archlinux.jpg"

## prompt
curl -sS https://starship.rs/install.sh | sh # -s -- --bin-dir /usr/local/bin
starship preset gruvbox-rainbow > ~/.config/starship.toml

## AI
# TODO: curl -fsSL https://claude.ai/install.sh | bash

## niri
# TODO:
#  in ${HOME}/.config/niri/config.kdl,
#   uncomment 
#    focus-follows-mouse max-scroll-amount="0%"
#  in ${HOME}/.config/niri/dms/binds.kdl,
#   change
#    Mod+L to Mod+Return
#   add
#    Mod+B hotkey-overlay-title="Open Browser" { spawn "librewolf"; }

## start tailscale
sudo systemctl start tailscaled
sudo systemctl enable tailscaled

echo "Done!"
