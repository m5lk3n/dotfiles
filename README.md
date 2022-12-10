# dotfiles

This repo contains my current dotfiles (currently only `.vimrc`).

Personally, I use yet another Fedora 37 Workstation installation and macOS Ventura, both preferably with `zsh`. In addition to that, I use `bash` in different (cloud) environments for my work.

The only common denominator is `vim`.

## Requirements

This setup also assumes tools like `git` and `curl` to be installed on the system.

### vim

"vim with python3" support is required. To install on macOS with `brew`:

`brew install vim -vd protobuf`

#### plugin-manager

Install [vim-plug](https://github.com/junegunn/vim-plug):

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

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
