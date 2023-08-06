#!/bin/sh

if command -v paru >/dev/null; then
  echo "info: paru is already installed"
  exit 0
fi

echo "info: We need sudo to install dependencies"
sudo pacman -S --needed base-devel

if ! command -v rustc >/dev/null; then
  echo "error: Please install the rust toolchain first"
  exit 1
fi

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
