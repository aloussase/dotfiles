packages := fish kitty nvim rofi emacs R helix wezterm redshift polybar

all: install

install: 
	stow --dotfiles $(packages)

uninstall: 
	stow -D --dotfiles $(packages)

.PHONY: install
