TIMESTAMP := $(shell date +%s)

# default target
.PHONY: help
help:
	@echo "usage: make <target>"
	@echo
	@echo "  where <target> is one of the following"
	@echo
	@echo "    vimrc  to back up ~/.vimrc to ~/.bak/.vimrc.<timestamp> (creates ~/.bak/ if needed),"
	@echo "           to copy this repo's .vimrc to ~ and"
	@echo "           to invoke vim plugin installation"
	@echo
	@echo "    zshrc  to back up ~/.zshrc to ~/.bak/.zshrc.<timestamp> (creates ~/.bak/ if needed) and"
	@echo "           to copy this repo's .zshrc to ~"
	@echo
	@echo "    all    to run all targets"
	@echo
	@echo "    help   to show this text"

# checks existence of required tool stack, fails if not available
.PHONY: needs_curl
needs_curl:
	curl --version > /dev/null

.PHONY: needs_vim
needs_vim: needs_grep
	vim --version | grep python3 > /dev/null

.PHONY: needs_grep
needs_grep:
	grep --version > /dev/null

.PHONY: needs_gopls
needs_gopls:
	gopls version > /dev/null

.PHONY: needs_zsh
needs_zsh:
	zsh --version > /dev/null

# tasks
.PHONY: zshrc
zshrc: needs_zsh
	@echo "############### BACKUP ###############" 
	mkdir -p ~/.bak
ifeq ($(shell test -s ~/.zshrc && echo -n yes),yes)
	cp ~/.zshrc ~/.bak/.zshrc.${TIMESTAMP}
endif
	@echo
	@echo "############### INSTALL ###############"
	cp .zshrc ~
	@echo "==============> Done with zsh config, to activate: source ~/.zshrc"

.PHONY: vimrc
vimrc: needs_curl needs_vim needs_gopls
	@echo "############### BACKUP ###############"
	mkdir -p ~/.bak
ifeq ($(shell test -s ~/.vimrc && echo -n yes),yes)
	cp ~/.vimrc ~/.bak/.vimrc.${TIMESTAMP}
endif
	@echo
	@echo "############### INSTALL ###############"
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	cp .vimrc ~
	@echo "==============> When the following pauses, press a key to continue and wait for the plugin installation to finish!"
	vim -c ":PlugInstall" -c ":qall!" 2>/dev/null
	@echo "==============> Done with Vim setup, happy Vim-ing."

.PHONY: all
all: zshrc vimrc
	@echo "==============> Installed all dotfiles"
