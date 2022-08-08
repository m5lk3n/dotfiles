# setup i3gaps

## baseline

- install Linux Mint 20.1
- uninstall 
  - thunderbird
- install chrome
  - settings: themes -> gtk+
- install code
- install nvim
  - install gruvbox

## bash enhancements

### CTRL+R enhancement

```bash
# install fzf
$ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
$ ~/.fzf/install
```

### fancy prompt

```bash
$ sudo apt-get install fonts-powerline
$ curl -sS https://raw.githubusercontent.com/diogocavilha/fancy-git/master/install.sh | sh
~/.fancy-git
$ more app_config
style:dark-col-double-line
show-full-path:true
show-user-at-machine:false
show-time:false
fresh_file
```

### change appearance

```bash
$ sudo apt install lxappearance
$ lxappearance
# switch all tabs to mint-dark brown
```

## i3

### focus

make sure to have set `focus_follows_mouse yes` in `.config/i3/config`

### background/wallpaper

```bash
$ sudo apt install nitrogen
$ nitrogen
```

add `exec --no-startup-id nitrogen --restore` to `.config/i3/config`

### transparent terminal

```bash
$ sudo apt install compton
```

add the following to `.config/compton.conf`

`opacity-rule = ["85:class_g = '*'"];`

add `exec --no-startup-id compton` to `.config/i3/config`

### config dmenu

comment `dmenu_run`

add `bindsym $mod+d exec --no-startup-id i3-dmenu-desktop --dmenu="dmenu -i -fn 'monospace:pixelsize=20'"`

### config i3-lock

add `bindsym $mod+shift+F12 exec i3lock -c 000000`

### disable

- remove stacked & tabbed

### assign apps to workspace

add to `.config/i3/config`:

```bash
# Force window to workspace - Find the class using xprop
# Use the last class found with xprop!
for_window [class="Google-chrome"] move to workspace $ws2
for_window [class="Code"] move to workspace $ws3
# WORKS: assign [class="Code"] $ws3
```

### custom keybindings

```bash
~/.config/i3 
$ grep \$alt config
set $alt Mod1
bindsym $mod+$alt+k exec cinnamon-settings keyboard
bindsym $mod+$alt+s exec cinnamon-settings sound
bindsym $mod+$alt+b exec cinnamon-settings bluetooth
```

#### floating windows for custom keybindings

```bash
~/.config/i3 
$ more config
# ...
for_window [class="cinnamon-settings.*"] floating enable
for_window [class="Blueberry.py"] floating enable
# ...
```

## Misc.

see [modern-unix](https://github.com/ibraheemdev/modern-unix)

install
- [glow](https://github.com/charmbracelet/glow)
	- `go build` binary
 	- `sudo mv glow /usr/local/bin`
- [lsd](https://github.com/Peltoche/lsd#installation)
	- `$ alias ll='lsd -al'`
- [duf](https://github.com/muesli/duf)
	- `go build` binary
 	- `sudo mv duf /usr/local/bin`
- [broot](https://github.com/Canop/broot)
    - [via apt](https://packages.azlux.fr/)
- [fd](https://github.com/sharkdp/fd)
    - `sudo ln -s /usr/bin/fdfind /usr/local/bin/fd`
- [rigprep](https://github.com/BurntSushi/ripgrep): `sudo apt install ripgrep`
