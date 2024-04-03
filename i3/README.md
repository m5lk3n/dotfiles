# How to install and configure i3 on Linux Mint 21.3 Cinnamon Edition

**AT WORK**

Install [Linux Mint 21.3 Cinnamon Edition](https://www.linuxmint.com/edition.php?id=311).

First Steps
-> Desktop Colors -> Launch:
  Choose Dark
  -> Advanced settings:
     Mouse Pointer: Adwaita
     Applications, Icons, Desktop: Mint-Y-Dark-Aqua

-> System Settings -> Launch:
   Mouse and Touchpad -> Touchpad: Reverse scrolling direction

```
sudo apt remove thunderbird
sudo apt remove libreoffice-*
```

```
sudo apt update
sudo apt upgrade
```

`sudo apt install git i3 lxappearance nitrogen compton rofi gimp`

log out, choose i3, log in

`lxappearance` 
-> Widget: Mint-Y-Dark-Aqua
-> Icon Theme: Mint-Y-Aqua

```
mkdir -p ~/Pictures/wallpapers"
curl https://petapixel.com/assets/uploads/2021/11/LoneCypressSunsetalt5K-scaled.jpeg > ~/Pictures/wallpapers/current.jpg
```

Start terminal
-> Preferences
  -> Text: Custom font: Monospace 12
  -> Colors: Use transparent background

```
mkdir .config/i3status
curl https://raw.githubusercontent.com/m5lk3n/dotfiles/main/archived/i3gaps/i3status/config > .config/i3status/config
```

TBC

**TODO**

- `bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"`
- install code
- install chrome (?)
