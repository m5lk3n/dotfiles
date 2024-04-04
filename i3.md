# How to install and configure i3 on Linux Mint 21.3 Cinnamon Edition

Install [Linux Mint 21.3 Cinnamon Edition](https://www.linuxmint.com/edition.php?id=311).

```
# First Steps
# -> Desktop Colors -> Launch:
#    Choose Dark
#    -> Advanced settings:
#       Mouse Pointer: Adwaita
#       Applications, Icons, Desktop: Mint-Y-Dark-Aqua
# -> System Settings -> Launch:
#    Mouse and Touchpad -> Touchpad: Reverse scrolling direction
```

`sudo apt remove thunderbird libreoffice-*`

```
sudo apt update
sudo apt upgrade -y
```

`sudo apt install git i3 lxappearance nitrogen compton rofi golang gopls gimp chromium`

Log out, choose i3, log in.

```
lxappearance
# -> Widget: Mint-Y-Dark-Aqua
# -> Icon Theme: Mint-Y-Aqua
```

```
mkdir -p ~/Pictures/wallpapers"
curl https://petapixel.com/assets/uploads/2021/11/LoneCypressSunsetalt5K-scaled.jpeg > ~/Pictures/wallpapers/current.jpg
```

```
# Start terminal
# -> Preferences
#    -> Text: Custom font: Monospace 12
#    -> Colors: Use transparency from system theme
```

```
sudo apt install powerline
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
vi ~/.bashrc # OSH_THEME="powerline"
source ~/.bashrc
```

Install [Visual Studio Code on Linux](https://code.visualstudio.com/docs/setup/linux#_debian-and-ubuntu-based-distributions)

Copy this repo's i3 config files in your profile: `cp -r .config/ ~`

Restart i3.

```
rofi-theme-selector
# -> Arc-Dark -> Enter -> Alt+a
```

```
chromium
# Settings -> Appearance -> Use GTK
```

Restart machine (or just `dunst` and maybe others...).

## Bookmarks

- [i3 Reference Card](https://i3wm.org/docs/refcard.html)
- [i3 User’s Guide](https://i3wm.org/docs/userguide.html)

---

- [Sample i3-gaps-config](https://raw.githubusercontent.com/TylerWolfDev/i3-gaps-config/master/config)
