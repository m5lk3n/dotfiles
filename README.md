# dotfiles

My opinionated setup on top of the opinionated [Omarchy 2.0](https://omarchy.org/) (v2.1.0 at the time of writing (2025-09-05)).

![My Omarchy](./myomarchy.png)

## Changes

- Removes the packages/web apps along with its default config (where applicable) as per [this script](uninstall-defaults.sh).

- Installs additional packages and config as per [this script](./setup.sh).

- Changes the following in Omarchy:
  - to have no window gaps
  - disables the default screen saver, however not the lock screen
  - default key bindings
  - increases default terminal font size
  - changes Jetbrains app window behavior to be floating (required to work around [#1300](https://github.com/basecamp/omarchy/issues/1300) related to Android Studio)

## Disclaimer

**Warning!**

This setup:

- Modifies configuration files! (only `~/.bashrc` and `hyprland.conf` are backed up.)

- Installs and uninstalls packages!

- Changes could only be reverted manually!

- Comes as-is, without support/warranty/guarantee/whatsoever!

**Use at your own risk!**

**I take no responsibility!**

## Usage

```bash
make setup
```

## To do

- Automate Android Studio and Android SDK installation
- Automate Flutter installation