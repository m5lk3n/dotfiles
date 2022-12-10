TIMESTAMP := $(shell date +%s)

# default target
.PHONY: help
help:
	@echo "usage: make <target>"
	@echo
	@echo "  where <target> is one of the following"
	@echo
	@echo "    install    to back up ~/.vimrc (if existing) to ~/.bak/.vimrc.<timestamp> (creates ~/.bak if needed),"
	@echo "               to copy this repo's .vimrc to ~ and"
	@echo "               to invoke vim plugin installation"
	@echo
	@echo "    help       to show this text"

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

# tasks
.PHONY: install
install: needs_curl needs_vim needs_gopls
	@echo "############### BACKUP ###############"
	mkdir -p ~/.bak
	test -s ~/.vimrc && cp ~/.vimrc ~/.bak/.vimrc.${TIMESTAMP}
	@echo
	@echo "############### INSTALL ###############"
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	cp .vimrc ~/.vimrc
	@echo "==============> When the following pauses, press a key to continue and wait for the plugin installation to finish!"
	vim -c ":PlugInstall" -c ":q!" -c ":q!" 2>/dev/null
	@echo "==============> Done with vim setup, happy vim-ing."
