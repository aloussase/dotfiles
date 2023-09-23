packages := fish kitty nvim rofi emacs R helix wezterm redshift

all: install

install: 
	stow --dotfiles $(packages)

uninstall: 
	stow -D --dotfiles $(packages)

.PHONY: install
