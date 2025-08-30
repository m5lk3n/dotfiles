## help: print this help message
.PHONY: help
help:
	@echo 'usage: make <target>'
	@echo
	@echo '  where <target> is one of the following:'
	@echo
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' | sed -e 's/^/ /'

## setup: install dotfiles & packages, configure system, remove unwanted stuff
.PHONY: setup
setup:
	@echo "Running setup..."
	@./setup.sh
	@echo "Running uninstall-defaults..."
	@./uninstall-defaults.sh
	@echo "Running postsetup..."
	@./postsetup.sh