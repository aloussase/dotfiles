#!/bin/bash

INSTALL_DIR=${1:-"$XDG_CONFIG_HOME"}

[ -z "$INSTALL_DIR" ] && { echo 'Installation directory unspecified' && exit 1; }

mkdir -p "$INSTALL_DIR"

cd /tmp || { echo 'Failed to enter /tmp directory' && exit 1; }

echo "Installing nvim configuration in $INSTALL_DIR"

git clone https://github.com/aloussase/dotfiles >/dev/null || exit 1
cd dotfiles && cp -r ./nvim/.config/nvim "$INSTALL_DIR" && cd .. && rm -rf dotfiles

echo 'Successfully installed nvim configuration'
exit 0
