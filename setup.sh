#!/bin/bash

if [ "$EUID" -eq 0 ]; then
  echo "This is not intended to be run as root."
  exit 1
fi
if [ ! -d "${HOME}/.config/DankMaterialShell" ]; then
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

echo "Starting setup..."

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
    code \
    docker \
    docker-compose \
    evince \
    exiftool \
    eza \
    gvfs-smb \
    gimp \
    glow \
    go \
    jq \
    lazygit \
    lazydocker \
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

yay --noconfirm --answerclean All --answerdiff None -S librewolf-bin systemd-manager-tui

# VS Code config
CODE_CONFIG_DIR=".config/Code - OSS/User"
mkdir -p "${HOME}/${CODE_CONFIG_DIR}"
cp "${CODE_CONFIG_DIR}/settings.json" "${HOME}/${CODE_CONFIG_DIR}"

# tools requiring Go
go install heckel.io/pcopy@latest # "build at" info is missing
go install github.com/cheat/cheat/cmd/cheat@latest
CHEAT_CONFIG_DIR=.config/cheat/cheatsheets/personal
mkdir -p "${HOME}/$CHEAT_CONFIG_DIR"
cp -r $CHEAT_CONFIG_DIR/* "${HOME}/$CHEAT_CONFIG_DIR"

## desktop wallpaper
curl https://raw.githubusercontent.com/basecamp/omarchy/refs/heads/dev/themes/ristretto/backgrounds/1-color-curves.jpg -o "${HOME}/Pictures/wallpaper.jpg"

## prompt
curl -sS https://starship.rs/install.sh | sh # -s -- --bin-dir /usr/local/bin
starship preset gruvbox-rainbow > ~/.config/starship.toml

## niri
sed -i 's|^[[:space:]]*//[[:space:]]*focus-follows-mouse|    focus-follows-mouse|' $HOME/.config/niri/config.kdl
CFG="$HOME/.config/niri/dms/binds.kdl"
sed -i 's/\bMod+T\b/Mod+Return/' "$CFG"
sed -i '$ s|^}$|    // === Browser ===\n    Mod+B hotkey-overlay-title="Open Browser" { spawn "librewolf"; }\n}|' "$CFG"

## start tailscale
sudo systemctl start tailscaled
sudo systemctl enable tailscaled

## root config
echo alias vi='vim' | sudo tee -a "/root/.bashrc"

echo "Setup complete."
echo ""
echo "Please run 'spf', followed by 'make setup-spf' to configure Superfile, and 'make postsetup' for final steps."
