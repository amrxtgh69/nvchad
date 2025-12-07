#!/bin/zsh

echo "🔧 Installing NvChad config..."

rm -rf ~/.config/nvim

mkdir -p ~/.config/nvim

cp -r ~/nvchad/* ~/.config/nvim

echo "✅ Done!"

