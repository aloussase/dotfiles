packages := vim fish kitty

all: install

install: 
	stow --dotfiles $(packages)

.PHONY: install
