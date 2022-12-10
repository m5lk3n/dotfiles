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

.PHONY: install
install:
	@echo "############### BACKUP ###############"
	mkdir -p ~/.bak
	[[ -e ~/.vimrc ]] && cp ~/.vimrc ~/.bak/.vimrc.${TIMESTAMP}
	@echo
	@echo "############### INSTALL ###############"
	cp .vimrc ~/.vimrc
	vim -c ":PlugInstall" -c ":q!" -c ":q!"