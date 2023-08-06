#!/bin/sh

if ! command -v paru >/dev/null; then
  echo "error: Please install paru first" >&2
  exit 1
fi

paru -Sy --needed \
    neovim \
    otf-hasklig-nerd \
