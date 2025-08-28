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
	@echo "AT WORK"
#	@echo "Running install..."
#	@./install.sh
#	@echo "Running postinstall..."
#	@./postinstall.sh
#	@echo "Running uninstall..."
#	@./uninstall.sh
#	@echo "Done!"
#	@echo ""
#	@echo "Next: Set up Fido manually..."