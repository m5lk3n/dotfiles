# dotfiles

:construction: **WORK IN PROGRESS, NOT VERIFIED YET!**

[My](https://michael-klein.info) opinionated setup on top of Arch Linux and Dank Linux with [niri](https://github.com/niri-wm/niri) as "*scrollable-tiling* Wayland compositor".

## What this repo provides

- Installs additional packages and config as per [setup script](./setup.sh)
- Provides some post-setup recommendations as per [this documentation](./postsetup.md)

## Prerequisites

**1. Install [Arch Linux](https://wiki.archlinux.org/title/Installation_guide) (I used `archinstall`)!** 

**2. Install [Dank Linux](https://danklinux.com):**

  ```bash
  curl -fsSL https://install.danklinux.com/ | sh
  sudo shutdown -r now
  ```

**3. Reboot**

## Setup

Once, Dank Linux is installed and the machine is rebooted:

```bash
make setup
```

---

## Disclaimer

**Warning!**

This setup:

- Modifies configuration files! (only `~/.bashrc` is backed up.)

- Installs packages!

- Changes could only be reverted manually!

- Comes as-is, without support/warranty/guarantee/whatsoever!

**Use at your own risk!**

**I take no responsibility!**

---

## To do

- Set up Fido (for sudo)
- Set up lock screen
- Install Claude CLI
- Install Copilot CLI
- Automate VS Code extension installation