#!/bin/bash

if [ "$EUID" -eq 0 ]; then
    echo "This is not intended to be run as root."
    exit 1
fi

# Superfile config
## https://superfile.netlify.app/configure/superfile-config/
CFG="$HOME/.config/superfile/config.toml"
if [ -f "$CFG" ]; then
  echo "Configuring Superfile..."
else
  echo "Superfile config not found at $CFG, please run `spf` first."
  exit 0
fi

sed -i \
  -e 's/^cd_on_quit = .*/cd_on_quit = true/' \
  -e 's/^theme = .*/theme = "0x96f"/' \
  -e 's/^metadata = .*/metadata = true/' \
  "$CFG"

echo "Superfile configured successfully."