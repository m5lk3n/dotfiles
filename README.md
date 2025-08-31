# dotfiles

My opinionated setup on top of the opinionated [Omarchy 2.0](https://omarchy.org/).

## Changes

- Removes the following packages/web apps along with its default config (where applicable) as per [this script](uninstall-defaults.sh).

- Installs additional packages and config as per [this setup](./setup.sh). Mainly, Superfile<sup>0</sup>, Flutter, Golang, Librewolf, Android Studio, VS Code.

- Changes the following in Omarchy:
  - to have no window gaps
  - disables the default screen saver, however not the lock screen
  - default key bindings
  - increases default terminal font size
  - changes Jetbrains app window behavior to be floating (required to work around[#1300](https://github.com/basecamp/omarchy/issues/1300))

<sup>0</sup>: Assumes "Tokyo Night" as the underlying theme.

## Disclaimer

**Warning!**

This setup:

- Modifies configuration files! (only `~/.bashrc` and `hyprland.conf` are backed up.)

- Installs and uninstalls packages!

- Has no uninstall!

- Comes as-is, without support/warranty/guarantee/whatsoever!

**Use at your own risk!**

**I'm not responsible for anything!**

## Usage

```bash
make setup
```