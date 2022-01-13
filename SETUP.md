# Set up Pop!_OS

This is how I set up Pop!_OS (21.10 at the time of writing) on my personal machines.

## General Remarks

- follow step-by-step
- font installations may require (app) restarts

## Baseline

- install [Pop!_OS 21.10](https://pop.system76.com/)
  - menu bar settings
    - Tile Windows
    - Floating Window Exceptions -> Configure
    - Show Active Hint
- install nvim
  ```bash
  sudo apt install neovim
  ```
  restore [.vimrc](.vimrc) to `~`
- install chrome
  ```bash
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt install ./google-chrome-stable_current_amd64.deb
  rm ./google-chrome-stable_current_amd64.deb
  ```
- install go
  ```bash
  sudo apt install golang-go
  ```
- install vscode
  ```bash
  wget -O vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
  sudo apt install ./vscode.deb
  rm ./vscode.deb
  ```
  - install [DejaVu Sans Mono for Powerline](https://stackoverflow.com/questions/64036536/strange-characters-for-ohmyz-in-vscode) font
    - browse to https://github.com/powerline/fonts/blob/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20for%20Powerline.ttf -> Download -> Install 
  - restore [settings.json](.config/Code/User/settings.json) to `.config/Code/User`

### Pop!_OS

- Settings
  - Desktop
    - General -> Show Maximize Button
    - Background -> Select
    - Dock -> Dock Visibility -> Always hide
  - Accessibility -> Large Text
  - Date & Time -> Time Format
  - About -> Device Name

## Gnome Tweaks

```bash
sudo apt install gnome-tweak-tool
sudo apt install gnome-shell-extensions # requires logout for auto-move-windows to become available, see below
gnome-tweaks
```

Extensions
- Auto move windows
  - Add Google Chrome on 1 (=workspace)
  - Add Visual Studio Code on 2

Startup Applications
- Add Google Chrome

Top Bar
- Configure

Window Titlebars
- Configure

Windows
- Focus on Hover

## Gnome Terminal

- Preferences
  - Pop
    - Text -> Custom font: DejaVu Sans Mono 12
    - Colors -> Use transparent background: 25%

## Tools

- [gnome-passwordsafe](https://gitlab.gnome.org/World/PasswordSafe)
  ```bash
  sudo apt install gnome-passwordsafe
  ```
- [fzf](https://github.com/junegunn/fzf) (ctrl+r enhancement)
  ```bash
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
  ```
- [glow](https://github.com/charmbracelet/glow) (visualize markdown in terminal)
  ```bash
  mkdir ~/git && cd ~/git
  git clone https://github.com/charmbracelet/glow.git
  cd glow
  go build
  sudo mv glow /usr/local/bin
  ```
- [lsd](https://github.com/Peltoche/lsd#installation) (ls deluxe)
  ```bash
  alias ll='lsd -al'
  ```
  - restore [config.yaml](.config/lsd/config.yaml) to `.config/lsd`
- [broot](https://github.com/Canop/broot) (terminal-based folder navigation)
    - [via apt](https://packages.azlux.fr/)
      ```bash
      sudo apt install broot
      ```
- [bashtop](https://github.com/aristocratos/bashtop)
  ```bash
  sudo apt install bashtop
  ```
- trash-cli
  ```bash
  sudo apt install trash-cli
  ```
- neofetch
  ```neofetch
  sudo apt install neofetch
  ```

## [oh-my-bash](https://github.com/ohmybash/oh-my-bash)

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
sudo apt install fonts-powerline
```

restore [.bashrc](.bashrc) to `~`

## Keybindings

see [dconf](.config/dconf/user.conf)

## Optional: Enable 2FA

- follow steps 1-3 in [How to Use Two-Factor Authentication with Ubuntu](https://www.tecmint.com/enable-two-factor-authentication-in-ubuntu/)
- disable verification for sudo as per [this answer](https://askubuntu.com/a/942583)
