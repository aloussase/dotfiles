packages := vim

all: install

install: 
	stow --dotfiles $(packages)

.PHONY: install
