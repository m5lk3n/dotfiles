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
  - Optional: To avoid the following `archinstall` step to fail with "Device or resource busy" on `wipefs`, you may need to run the following:
    - `lvchange -an /dev/ArchinstallVg/root` (or similar, check with `lvdisplay`)
    - `fdisk /dev/nvme0n1` (or similar, check with `lsblk`) to delete an existing partition or existing partitions
  - Run `archinstall` (or [follow the installation guide](https://wiki.archlinux.org/title/Installation_guide))

- On Arch, install [Dank Linux](https://danklinux.com):

  ```bash
  curl -fsSL https://install.danklinux.com/ | sh
  ```

- **Reboot**:

  ```bash
  sudo shutdown -r now
  ```

- clone this repo:

  ```bash
  mkdir -p ~/Work && cd ~/Work # just my preference 
  git clone https://github.com/m5lk3n/dotfiles.git
  cd dotfiles
  ```

## Setup

```bash
make setup
spf
make setup-spf
make postsetup
source ~/.bashrc
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

- Automate VS Code extension installation

## Open

- `sgpt`?