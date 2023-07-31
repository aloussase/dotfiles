packages := vim fish

all: install

install: 
	stow --dotfiles $(packages)

.PHONY: install
