# setup Pop!_OS

## baseline

- install Pop!_OS 21.04
  - menu bar settings
    -> Tile Windows + Show Active Hint
- install chrome
  - settings: themes -> gtk+
- install go: `$ sudo apt install golang-go`
- install code
- install nvim
  ```bash
  $ more .vimrc 
  set number 
  set nocompatible
  ```

### os

- Settings
  - Desktop -> General -> Show Maximize Button
  - Accessibility -> Large Text

## tweaks

```bash
$ sudo apt install gnome-tweak-tool
$ sudo apt install gnome-shell-extensions
$ gnome-tweaks
```

Extensions -> Auto move windows
  -> Add Google Chrome with 3 (=workspace)

Startup Applications
  -> Add Google Chrome

Top Bar
  -> Configure

Window Titlebars
  -> Configure

Windows
  -> Focus on Hover

## powershell

### Preferences -> Pop

Text -> Custom font: DejaVu Sans Mono 12

Colors -> Use transparent background: ca. 25%

## [oh-my-bash](https://github.com/ohmybash/oh-my-bash)

```bash
$ bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
$ sudo apt install fonts-powerline # OPTIONAL?
```

## install tools

```bash as CTRL+R enhancement
# install fzf
$ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
$ ~/.fzf/install
```

- [glow](https://github.com/charmbracelet/glow)
	- `go build` binary
 	- `sudo mv glow /usr/local/bin`
- [lsd](https://github.com/Peltoche/lsd#installation)
	- `$ alias ll='lsd -al'`
- [broot](https://github.com/Canop/broot)
    - [via apt](https://packages.azlux.fr/)

## keybindings

see [dconf](.config/dconf/user.conf)
