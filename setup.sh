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

echo "This will overwrite configuration files! Only ~/.bashrc will be backed up. THIS SETUP IS NOT IDEMPOTENT! USE AT YOUR OWN RISK."
echo "For more details, please see https://github.com/m5lk3n/dotfiles/."
read -p "Continue? [y/N]: " confirm
if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 1
fi

echo "Starting setup..."

# back up .bashrc before overwriting
TS=$(date +%Y%m%d-%H%M%S)
cp "${HOME}/.bashrc" "${HOME}/.bashrc.bak-$TS"

# .bashrc
echo "" >> "${HOME}/.bashrc"
echo "# from https://github.com/m5lk3n/dotfiles:" >> "${HOME}/.bashrc"
echo "eval \"\$(starship init bash)\"" >> "${HOME}/.bashrc" # prompt
echo "eval \"\$(zoxide init bash)\"" >> "${HOME}/.bashrc" # "cd"
echo "source ~/.spf" >> "${HOME}/.bashrc" # superfile, see below
echo "source ~/.misc" >> "${HOME}/.bashrc"
echo "bind 'set completion-ignore-case on'" >> "${HOME}/.bashrc"
echo "source /usr/share/bash-completion/bash_completion" >> "${HOME}/.bashrc"
echo "source /usr/share/fzf/completion.bash" >> "${HOME}/.bashrc"
echo "source /usr/share/fzf/key-bindings.bash" >> "${HOME}/.bashrc"

## dotfiles .bashrc additions
cp .spf "${HOME}"
cp .misc "${HOME}"

# install additional packages via pacman
sudo pacman -Syu --noconfirm --needed \
    alsa-utils \
    bash-completion \
    bat \
    bluez \
    bluez-utils \
    code \
    docker \
    docker-compose \
    evince \
    exiftool \
    eza \
    fastfetch \
    fd \
    fzf \
    gimp \
    glow \
    gnome-calculator \
    gnome-disk-utility \
    go \
    golangci-lint \
    gvfs-smb \
    jq \
    lazygit \
    lazydocker \
    ncdu \
    noto-fonts-emoji \
    pipewire \
    pipewire-pulse \
    pipewire-alsa \
    rsync \
    superfile \
    tailscale \
    ttf-jetbrains-mono-nerd \
    unzip \
    wireplumber \
    usbutils \
    zoxide

# install yay
if ! command -v yay &> /dev/null; then
    echo "yay not found, installing..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    (cd /tmp/yay && makepkg -si --noconfirm)
    rm -rf /tmp/yay
else
    echo "yay already installed, skipping."
fi

# install AUR packages via yay
yay --noconfirm --answerclean All --answerdiff None -S \
    librewolf-bin \
    systemd-manager-tui \
    whosthere-bin

# VS Code config
CODE_CONFIG_DIR=".config/Code - OSS/User"
mkdir -p "${HOME}/${CODE_CONFIG_DIR}"
cp "${CODE_CONFIG_DIR}/settings.json" "${HOME}/${CODE_CONFIG_DIR}"

# tools requiring Go
go install golang.org/x/vuln/cmd/govulncheck@latest
go install github.com/securego/gosec/v2/cmd/gosec@latest
go install heckel.io/pcopy@latest # "build at" info is missing
go install github.com/cheat/cheat/cmd/cheat@latest
CHEAT_CONFIG_DIR=.config/cheat/cheatsheets/personal
mkdir -p "${HOME}/$CHEAT_CONFIG_DIR"
cp -r $CHEAT_CONFIG_DIR/* "${HOME}/$CHEAT_CONFIG_DIR"

## desktop wallpaper (download from original source, but there's a backup in the repo's Pictures directory in case it gets removed)
curl -L https://raw.githubusercontent.com/basecamp/omarchy/refs/heads/dev/themes/ristretto/backgrounds/1-color-curves.jpg -o "${HOME}/Pictures/wallpaper.jpg"

## custom fastfetch
FASTFETCH_CONFIG_DIR=".config/fastfetch"
mkdir -p "${HOME}/${FASTFETCH_CONFIG_DIR}"
cp "${FASTFETCH_CONFIG_DIR}/config.jsonc" "${HOME}/${FASTFETCH_CONFIG_DIR}"

## prompt
curl -sS https://starship.rs/install.sh | sh # -s -- --bin-dir /usr/local/bin
starship preset gruvbox-rainbow > ~/.config/starship.toml

## niri
NIRI_CFG="$HOME/.config/niri/config.kdl"
sed -i 's|^[[:space:]]*//[[:space:]]*focus-follows-mouse|    focus-follows-mouse //|' $NIRI_CFG
sed -i '/\.Nautilus/d' $NIRI_CFG
echo "include \"dms/windowrules.kdl\"" >> "$NIRI_CFG"
DMS_CONFIG_DIR=".config/niri/dms"
cp "${DMS_CONFIG_DIR}/windowrules.kdl" "${HOME}/${DMS_CONFIG_DIR}"
BINDS_CFG="$HOME/.config/niri/dms/binds.kdl"
sed -i 's/\bMod+T\b/Mod+Return/' "$BINDS_CFG"
sed -i '$ s|^}$|    // === Browser ===\n    Mod+B hotkey-overlay-title="Open Browser" { spawn "librewolf"; }\n}|' "$BINDS_CFG"

## ghostty: set background-opacity to 0.8 -> this may require a reboot to take effect
GHOSTTY_CFG="$HOME/.config/ghostty/config"
sed -i 's|^background-opacity.*|background-opacity = 0.9|' "$GHOSTTY_CFG"

## groups
sudo usermod -aG docker $USER

## services
echo "Starting and enabling services (this may take a moment)..."
sudo systemctl enable --now bluetooth
sudo systemctl enable --now docker
sudo systemctl enable --now tailscaled
systemctl --user enable --now pipewire wireplumber pipewire-pulse

## root config
echo alias vi='vim' | sudo tee -a "/root/.profile"

echo "Setup complete."
echo ""
echo "Please run 'spf' and exit again, then run 'make setup-spf' to configure Superfile, and 'make postsetup' for final steps."
