#!/bin/zsh

set -e

NVIM_CONFIG="$HOME/.config/nvim"
SOURCE_DIR="$HOME/nvchad"

echo "🔧 Installing NvChad config..."

rm -rf "$NVIM_CONFIG"

cp -r "$SOURCE_DIR" "NVIM_CONFIG"

echo "✅ Done!"

