packages := fish kitty nvim rofi emacs R helix

all: install

install: 
	stow --dotfiles $(packages)

uninstall: 
	stow -D --dotfiles $(packages)

.PHONY: install
