# Set up Linux Mint

This is how I set up Linux Mint (21 at the time of writing) Cinnamon Edition on my personal machines.

## General Remarks

- follow step-by-step
- font installations may require (app) restarts

## Baseline

- install [Linux Mint 21 Cinnamon Edition](https://www.linuxmint.com/edition.php?id=299)
- install neovim
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
  - install [DejaVu Sans Mono Nerd Font](https://stackoverflow.com/questions/64036536/strange-characters-for-ohmyz-in-vscode) font
    - download https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DejaVuSansMono.zip -> extract -> double-click "DejaVu Sans Mono Nerd Font Complete.ttf" -> Install
  - delete downloaded and unzipped artifacts 
  - restore [settings.json](.config/Code/User/settings.json) to `.config/Code/User`

### Mint

```bash
cd /usr/share/backgrounds
sudo curl -L https://i.redd.it/ey1i5yi1h4571.jpg -o andromeda.jpg
sudo curl -L https://heise.cloudimg.io/v7/_www-heise-de_/imgs/18/3/5/7/4/9/2/6/main_image_star-forming_region_carina_nircam_final-5mb.jpg-e2ced363d8019611.jpeg -o carina-nebula.jpg
```

- System Settings
  - Login Window
    - Background -> /usr/share/backgrounds/carina-nebula.jpg
  - Backgrounds 
    - `+` -> Other Locations -> Computer -> /usr/share/backgrounds -> Open
    - Select andromeda.jpg
  - Themes
    - Choose Mint-Y-Dark-Aqua
  - Applets
    - Enable Workspace switcher
  - Date and Time
    - Choose Berlin
    - Use 24h clock
    - Display the date
  - Desktop
    - Desktop Icons -> Switch off but Mounted Drives
  - Windows
    - Behavior -> Window focus mode -> Mouse
  - Mouse and Touchpad
    - Touchpad -> Tap to click -> Enabled 
    - Touchpad -> Reverse scrolling direction -> Enabled

## Gnome Terminal

- Edit
  - Preferences
    - Text -> Custom font: DejaVu Sans Mono for Powerline 12
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
  mkdir ~/workspace && cd ~/workspace
  echo 'deb [trusted=yes] https://repo.charm.sh/apt/ /' | sudo tee /etc/apt/sources.list.d/charm.list
  sudo apt update && sudo apt install glow
  ```
- [lsd](https://github.com/Peltoche/lsd#installation) (ls deluxe)
  ```bash
  alias ll='lsd -al'
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

## Optional: Enable 2FA

- follow steps 1-3 in [How to Use Two-Factor Authentication with Ubuntu](https://www.tecmint.com/enable-two-factor-authentication-in-ubuntu/)
- disable verification for sudo as per [this answer](https://askubuntu.com/a/942583)
