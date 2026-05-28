<h1 align="center">dotfiles</h1>

<p align="center">
:construction: <b>WORK IN PROGRESS, NOT VERIFIED YET!</b>
</p>

<p align="center">
<a href="https://michael-klein.info">My</a> opinionated setup on top of Arch Linux and Dank Linux with <a href="https://github.com/niri-wm/niri">niri</a> as "<em>scrollable-tiling</em> Wayland compositor".
</p>

<p align="center">
Installs additional packages and config as per <a href="./setup.sh">setup script</a>. Provides some post-setup recommendations as per <a href="./postsetup.md">this documentation</a>.
</p>

## Prerequisites

- Install Arch Linux:

  - [Download the latest ISO](https://archlinux.org/download/) and copy it on a USB flash drive
  - Boot from USB stick
  - Run `archinstall` (or [follow the installation guide](https://wiki.archlinux.org/title/Installation_guide))

- On Arch, install [Dank Linux](https://danklinux.com):

  ```bash
  curl -fsSL https://install.danklinux.com/ | sh
  ```

- **Reboot**:

  ```bash
  sudo shutdown -r now
  ```

- Install `git` and clone this repo:

  ```bash
  sudo pacman -Syu git
  git clone https://github.com/m5lk3n/dotfiles.git
  ```

## Setup

```bash
make setup
```

---

## Bookmarks

- [A Quick First Look At The Niri Window Manager](https://youtu.be/uiXiD5foFCI)

- [Archive](https://github.com/m5lk3n/dotfiles/tree/archive)

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

**Also, I'm not responsible for external links!**

---

## To do

- Set up Fido (for sudo)
- Install Claude CLI
- Install Copilot CLI
- Automate VS Code extension installation

## Open

- `sgpt`?