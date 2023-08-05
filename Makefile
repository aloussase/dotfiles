packages := fish kitty nvim

all: install

install: 
	stow --dotfiles $(packages)

uninstall: 
	stow -D --dotfiles $(packages)

.PHONY: install
