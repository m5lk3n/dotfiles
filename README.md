# dotfiles

This repo contains my current dotfiles (just `.vimrc` at this time) that can be installed via `Makefile`.

Personally, I use yet another Fedora 37 Workstation installation and macOS Ventura, both preferably with `zsh`. In addition to that, I use `bash` in different (cloud) environments for my work.

The only common denominator is `vim`.

## Requirements

This setup also assumes tools like `curl` to be installed on the system. The existence of required tools is checked in the `Makefile`.

### vim

"vim with python3" support is required. To install on macOS with `brew`:

`brew install vim -vd protobuf`

### Golang

Install `go` with `gopls` (19.3 in my case at the time of writing).

[Configuring Vim to Develop Go Programs](https://medium.com/pragmatic-programmers/configuring-vim-to-develop-go-programs-e839641da4ac):

- [vim-go](https://github.com/fatih/vim-go)
- [completor](https://github.com/maralla/completor.vim)

## Installation

To copy the dotfiles and configure the plugins, run the following:

```bash
./make # run to show what happens when installing
./make install
```

See [.vimrc](.vimrc) comments for more.

## Post-Installation Updates

**Don't forget** to run `:PlugInstall` in `vim` for plugin updates.

## ARCHIVE

- [setup protocol mint 21](archived/mint-21/SETUP.md)
- [setup protocol pop_os 22.04](archived/pop_os-22.04/SETUP.md)
- [setup protocol pop_os 21.10](archived/pop_os-21.10/SETUP.md)
- [setup protocol i3gaps](archived/i3gaps/SETUP.md)
