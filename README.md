# dotfiles

**Disclaimer: Use at your own risk! Files will be overwritten using the below!**

This repo contains my current dotfiles that can be installed via `Makefile`.

Personally, I use yet another Fedora 37 Workstation installation (e.g. [set up on my Pi 400](SETUP.md)) and macOS Ventura, both preferably with `zsh`. In addition to that, I use `bash` in different (cloud) environments for my work.

The only common denominator is `vim`...

## Requirements

This setup also assumes tools like `curl` to be installed on the system. The existence of required tools is checked in the `Makefile`.

### Vim

Vim 8+ with Python 3 support is required. To install on macOS with `brew`:

`brew install vim -vd protobuf`

On Fedora 37, it seems to be enough to just run the default installation:

`sudo dnf install vim`

### Golang

Install `go` with `gopls` (19.3 in my case at the time of writing), e.g. on Fedora 37:

```bash
sudo dnf install golang-x-tools-gopls
sudo dnf install golang
```

[Configuring Vim to Develop Go Programs](https://medium.com/pragmatic-programmers/configuring-vim-to-develop-go-programs-e839641da4ac):

- [vim-go](https://github.com/fatih/vim-go)
- [completor](https://github.com/maralla/completor.vim)

## Installation

To copy the dotfiles and configure the plugins, run the following:

```bash
make # run to show what happens when installing
make install
```

See [.vimrc](.vimrc) comments for more.

### Z Shell

To also install the `.zshrc` individually, run `make install-zshrc`.
To install all dotfiles, run `make install-all`.

## Post-Installation Updates

**Don't forget** to run `:PlugInstall` in `vim` for plugin updates.

## ARCHIVE

- [setup protocol mint 21](archived/mint-21/SETUP.md)
- [setup protocol pop_os 22.04](archived/pop_os-22.04/SETUP.md)
- [setup protocol pop_os 21.10](archived/pop_os-21.10/SETUP.md)
- [setup protocol i3gaps](archived/i3gaps/SETUP.md)
