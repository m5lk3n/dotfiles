# dotfiles

**Disclaimer: Use at your own risk! Files will be overwritten using the below!**

This repo contains my current dotfiles that can be installed via `Makefile`.

Personally, I sometimes) use yet another Fedora 37 Workstation installation (e.g. [set up on my Pi 400](SETUP.md)) but mainly macOS Ventura, both preferably with `zsh`. In addition to that, I frequently use `bash` in different (cloud) environments for my work.

The only common denominator is `vim`...

## Requirements

This setup also assumes tools like `curl` to be installed on the system. The existence of required tools is checked in the `Makefile`.

Note: An existing `neovim` may break this `Makefile`'s dependency check. Please uninstall `neovim`; although I mean no disrespect here, you won't need it anymore anyway ;-)

The `Makefile` setup (where applicable) was successfully tested on the following systems:

- Macbook Pro M1, macOS Ventura (zsh)
- Raspberry Pi 400, Fedora 37 Workstation (zsh)
- Custom-built Asus Barebone-based solution, Linux Mint 21 (bash)
- Google Cloudshell (bash) (SSH-connected, not via browser!)

### Vim

Vim 8.2+ with Python 3 support is required.

To install on macOS with `brew`: `brew install vim -vd protobuf`

It seems to be enough to just run the default installation:

On Fedora 37: `sudo dnf install vim`

On Mint 21: `sudo apt install vim`

### Golang

Install `go` with `gopls` (19.3 in my case at the time of writing).

On Fedora 37:

```bash
sudo dnf install golang-x-tools-gopls
sudo dnf install golang
```

On Mint 21:

```bash
sudo apt install golang
sudo apt install gopls
```

[Configuring Vim to Develop Go Programs](https://medium.com/pragmatic-programmers/configuring-vim-to-develop-go-programs-e839641da4ac):

- [vim-go](https://github.com/fatih/vim-go)
- [completor](https://github.com/maralla/completor.vim)

## Installation

To copy all dotfiles and configure the plugins, run the following:

```bash
make # run to show what happens when installing
make all
```

See [.vimrc](.vimrc) comments for more.

To just install the `.vimrc` individually, run `make vimrc`.
For `.zshrc` only, run `make zshrc`.

Note: Especially when `.vimrc` is installed for the first time, it may take some time and the plug installer probably shows some errors - which are safe to ignore.

## Post-Installation Updates

**Don't forget** to run `:PlugInstall` in `vim` for plugin updates.

## Bookmarks / Sources

- [Configuring Vim to Develop Go Programs](https://medium.com/pragmatic-programmers/configuring-vim-to-develop-go-programs-e839641da4ac)
- [My [josean-dev] Dev Environment Files](https://github.com/josean-dev/dev-environment-files)

## ARCHIVE

- [setup protocol mint 21](archived/mint-21/SETUP.md)
- [setup protocol pop_os 22.04](archived/pop_os-22.04/SETUP.md)
- [setup protocol pop_os 21.10](archived/pop_os-21.10/SETUP.md)
- [setup protocol i3gaps](archived/i3gaps/SETUP.md)
