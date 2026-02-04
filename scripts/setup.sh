#!/bin/zsh

set -e

echo "Installing NvChad config..."

config_dir="$HOME/.config/nvim"
source_dir="$HOME/nvchad"

if [[ -z "$config_dir" || "$config_dir" == "/" ]]; then
  echo "Error: config_dir is unsafe: '$config_dir'"
  exit 1
fi

if [[ -z "$source_dir" || "$source_dir" == "/" ]]; then
  echo "Error: source_dir is unsafe: '$source_dir'"
  exit 1
fi

if [[ ! -d "$source_dir" ]]; then
  echo "Error: source_dir does not exist: '$source_dir'"
  exit 1
fi

if [[ "$config_dir" == "$source_dir" ]]; then
  echo "Error: config_dir and source_dir are the same: '$config_dir'"
  exit 1
fi

rm -rf "$config_dir"
mkdir -p "$config_dir"

# Copy config contents into the target directory.
cp -a "$source_dir/." "$config_dir/"

echo "Done!"
