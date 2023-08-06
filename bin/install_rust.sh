#!/bin/sh

echo "info: We need sudo to install 'rustup'"
sudo pacman -Sy rustup --needed >/dev/null

command -v rustup >/dev/null || {
  echo "error: Failed to install rustup" >&2
  exit 1
}

rustup default stable
rustup update
rustup component add rust-src
rustup component add rust-analyzer
