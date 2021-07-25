# Set up Pop!_OS

## Baseline

- install Pop!_OS 21.04
  - menu bar settings
    -> Tile Windows + Show Active Hint
- install nvim
  ```bash
  $ sudo apt install neovim
  $ # restore [.vimrc](.vimrc)
  ```
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

### OS

- Settings
  - Desktop -> General -> Show Maximize Button
            -> Background -> Select
  - Accessibility -> Large Text
  - Date & Time -> Time Format

## Gnome Tweaks

```bash
$ sudo apt install gnome-tweak-tool
$ sudo apt install gnome-shell-extensions # requires logout for auto-move-windows to become available, see below
$ gnome-tweaks
```

Extensions -> Auto move windows
  -> Add Google Chrome on 1 (=workspace)
  -> Add Visual Studio Code on 2

Startup Applications
  -> Add Google Chrome

Top Bar
  -> Configure

Window Titlebars
  -> Configure

Windows
  -> Focus on Hover

## Terminal

### Preferences -> Pop

Text -> Custom font: DejaVu Sans Mono 12

Colors -> Use transparent background: ca. 25%

## Tools

- [fzf](https://github.com/junegunn/fzf)
  ```bash
  $ # install fzf as ctrl+r enhancement
  $ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  $ ~/.fzf/install
  ```
- [glow](https://github.com/charmbracelet/glow)
  ```bash
  $ # visualize markdown in terminal
  $ mkdir ~/git && cd ~/git
  $ git clone https://github.com/charmbracelet/glow.git
  $ cd glow
	$ go build
 	$ sudo mv glow /usr/local/bin
  ```
- [lsd](https://github.com/Peltoche/lsd#installation)
	- `$ alias ll='lsd -al'`
- [broot](https://github.com/Canop/broot)
    - [via apt](https://packages.azlux.fr/): `sudo apt install broot`

## [oh-my-bash](https://github.com/ohmybash/oh-my-bash)

```bash
$ bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
$ sudo apt install fonts-powerline
$ # restore [.bashrc](.bashrc)
```

## Keybindings

see [dconf](.config/dconf/user.conf)

## Open

- ctrl+shift+v: unwanted control chars
- certain windows floating
