# Set up Pop!_OS

This is how I set up Pop!_OS (21.04 at the time of writing) on my personal machines.

## General Remarks

- follow step-by-step
- font installations may require (app) restarts

## Baseline

- install [Pop!_OS 21.04](https://pop.system76.com/)
  - menu bar settings
    - Tile Windows
    - Floating Window Exceptions -> Configure
    - Show Active Hint
- install nvim
  ```bash
  $ sudo apt install neovim
  ```
  restore [.vimrc](.vimrc) to `~`
- install chrome
  ```bash
  $ wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  $ sudo apt install ./google-chrome-stable_current_amd64.deb
  $ rm ./google-chrome-stable_current_amd64.deb
  ```
- install go: `$ sudo apt install golang-go`
- install code
  ```bash
  $ wget https://go.microsoft.com/fwlink/?LinkID=760868
  $ sudo install <vscode.deb>
  $ rm <vscode.deb>
  ```
  - install [DejaVu Sans Mono for Powerline](https://stackoverflow.com/questions/64036536/strange-characters-for-ohmyz-in-vscode) font:
    ```bash
    $ wget https://github.com/powerline/fonts/blob/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20for%20Powerline.ttf
    $ mv DejaVu\ Sans\ Mono\ for\ Powerline.ttf ~/.local/share/fonts/
    ```
  - restore [settings.json](.config/Code/User/settings.json) to `.config/Code/User`

### Pop!_OS

- Settings
  - Desktop
    - General -> Show Maximize Button
    - Background -> Select
    - Dock -> Dock Visibility -> Always hide
  - Accessibility -> Large Text
  - Date & Time -> Time Format

## Gnome Tweaks

```bash
$ sudo apt install gnome-tweak-tool
$ sudo apt install gnome-shell-extensions # requires logout for auto-move-windows to become available, see below
$ gnome-tweaks
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

- [fzf](https://github.com/junegunn/fzf) (ctrl+r enhancement)
  ```bash
  $ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  $ ~/.fzf/install
  ```
- [glow](https://github.com/charmbracelet/glow) (visualize markdown in terminal)
  ```bash
  $ mkdir ~/git && cd ~/git
  $ git clone https://github.com/charmbracelet/glow.git
  $ cd glow
	$ go build
 	$ sudo mv glow /usr/local/bin
  ```
- [lsd](https://github.com/Peltoche/lsd#installation) (ls deluxe)
	- `$ alias ll='lsd -al'`
- [broot](https://github.com/Canop/broot) (terminal-based folder navigation)
    - [via apt](https://packages.azlux.fr/): `$ sudo apt install broot`
- [bashtop](https://github.com/aristocratos/bashtop): `$ sudo apt install bashtop`
- trash-cli: `$ sudo apt install trash-cli`

## [oh-my-bash](https://github.com/ohmybash/oh-my-bash)

```bash
$ bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
$ sudo apt install fonts-powerline
```

restore [.bashrc](.bashrc) to `~`

## Keybindings

see [dconf](.config/dconf/user.conf)
