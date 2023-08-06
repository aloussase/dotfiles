#!/bin/sh

###
# Pacman Packages
###
echo "info: We need sudo to install packages"
sudo pacman -Sy --needed \
    lua-language-server \
    rust-analyzer \
    ccls \

###
# AUR Packages
###
    if ! command -v paru >/dev/null; then
  echo "warn: paru not found, skipping" >&2
else
    paru -Sy --needed \
        neovim \
        otf-hasklig-nerd \
        ghcup-hs-bin
fi

###
# Haskell packages
###
if ! command -v cabal >/dev/null; then
    echo "warn: cabal not found, skipping" >&2
else
    cabal install stylish-haskell
    cabal install hlint
    cabal install cabal-fmt
fi
