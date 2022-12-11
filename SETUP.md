# Setup Fedora 37 Workstation on a Pi 400

## Overclock

Add the following snippet to `/boot/efi/config.txt`:

```bash
over_voltage=6
arm_freq=2000
gpu_freq=700
```

Reboot.

## Z Shell 

Follow [How to Install and Setup Zsh (Z Shell) in Fedora](https://www.tecmint.com/install-zsh-shell-in-fedora/).

Install Oh My Zsh:

`sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

Install PowerLevel10K Theme for Oh My Zsh:

`git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k`

See also: [How To Setup Your Mac Terminal](https://www.josean.com/posts/terminal-setup)

## UI 

- Under Accessibility, enable Large Text

## Extend sdcard

Use `sudo fdisk -l` to identify the mmc-labeled partition which needs extension, e.g. 3rd on `mmcblk1`.

```bash 
sudo growpart /dev/mmcblk1 3
sudo btrfs filesystem resize max /
```

## Tooling

### Golang

```bash
sudo dnf install golang
```

### Glow

```bash
go install github.com/charmbracelet/glow@latest
sudo cp ./go/bin/glow /usr/local/bin
``` 
