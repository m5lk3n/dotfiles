TIMESTAMP := $(shell date +%s)

# default target
.PHONY: help
help:
	@echo "usage: make <target>"
	@echo
	@echo "  where <target> is one of the following"
	@echo
	@echo "    install  to back up ~/.vimrc and ~/.tmux.conf to ~/.bak/ with a <timestamp> appended (creates ~/.bak/ if needed),"
	@echo "             to copy this repo's dotfiles to ~ and"
	@echo "             to invoke vim plugin installation"
	@echo
	@echo "    install-zshrc  to back up existing ~/.zshrc to ~/.bak/.zshrc.<timestamp> (creates ~/.bak/ if needed) and"
	@echo "                   to copy this repo's .zshrc to ~"
	@echo
	@echo "    install-all  runs install-zshrc and install target"
	@echo
	@echo "    help	 to show this text"

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

.PHONY: needs_tmux
needs_tmux:
	tmux -V > /dev/null

.PHONY: needs_zsh
needs_zsh:
	zsh --version > /dev/null

# tasks
.PHONY: install-zshrc
install-zshrc: needs_zsh
	@echo "############### BACKUP ###############" 
	mkdir -p ~/.bak
ifeq ($(shell test -s ~/.zshrc && echo -n yes),yes)
	cp ~/.zshrc ~/.bak/.zshrc.${TIMESTAMP}
endif
	@echo
	@echo "############### INSTALL ###############"
	cp .zshrc ~

.PHONY: install
install: needs_curl needs_tmux needs_vim needs_gopls
	@echo "############### BACKUP ###############"
	mkdir -p ~/.bak
ifeq ($(shell test -s ~/.tmux.conf && echo -n yes),yes)
	cp ~/.tmux.conf ~/.bak/.tmux.conf.${TIMESTAMP}
endif
ifeq ($(shell test -s ~/.vimrc && echo -n yes),yes)
	cp ~/.vimrc ~/.bak/.vimrc.${TIMESTAMP}
endif
	@echo
	@echo "############### INSTALL ###############"
	cp .tmux.conf ~
	# vim
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	cp .vimrc ~
	@echo "==============> When the following pauses, press a key to continue and wait for the plugin installation to finish!"
	vim -c ":PlugInstall" -c ":q!" -c ":q!" 2>/dev/null
	@echo "==============> Done with vim setup, happy vim-ing."

.PHONY: install-all
install-all: install-zshrc install
	@echo "==============> Installing all dotfiles"
