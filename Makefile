## help: print this help message
.PHONY: help
help:
	@echo 'usage: make <target>'
	@echo
	@echo '  where <target> is one of the following:'
	@echo
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' | sed -e 's/^/ /'

## setup: install dotfiles & packages, configure system except for spf
.PHONY: setup
setup:
	@./setup.sh

## setup-spf: configure Superfile
.PHONY: setup-spf
setup-spf:
	@./setup-spf.sh

## postsetup: run post-setup configuration steps
.PHONY: postsetup
postsetup:
	@./postsetup.sh