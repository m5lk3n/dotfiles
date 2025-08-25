## help: print this help message
.PHONY: help
help:
	@echo 'usage: make <target>'
	@echo
	@echo '  where <target> is one of the following:'
	@echo
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' | sed -e 's/^/ /'

## install: install dotfiles
.PHONY: install
install:
	@echo "AT WORK"
#	@echo "Installing dotfiles..."
#	@./install.sh