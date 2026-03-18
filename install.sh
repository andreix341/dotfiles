#!/usr/bin/env bash

# This script is used to install the dotfiles from this repository.

set -euo pipefail

echo "Installing dotfiles..."

if ! grep -q 'ID=arch' /etc/os-release; then
  echo "This script is only supported on Arch Linux."
  exit 1
fi

# Update system
sudo pacman -Syu --noconfirm

# Install yay
if ! command -v yay &>/dev/null; then
  echo "Installing yay..."
  sudo pacman -S --noconfirm --needed git base-devel
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
fi

# Install packages
if [[ -f packages.txt ]]; then
  echo "Installing packages..."
  yay -Syu --needed --noconfirm $(cat packages.txt)
else
  echo "No packages.txt file found. Skipping package installation."
fi

# 5. Symlink all configs
echo "→ Symlinking configs..."
cd "$(dirname "$0")" # go to repo root

for dir in */; do
  app="${dir%/}"
  # Skip sddm and any non-config folders
  if [[ "$app" == "sddm" || "$app" == "."* ]]; then
    continue
  fi

  if [[ -d "$app" ]]; then
    target="$HOME/.config/$app"
    # Backup existing config
    if [[ -e "$target" ]]; then
      echo "Backing up $target → $target.bak"
      mv "$target" "$target.bak" 2>/dev/null || true
    fi
    ln -sfn "$PWD/$app" "$target"
    echo "✅ Linked $app"
  fi
done

# 6. Special handling for SDDM theme
if [[ -d "sddm/themes/silent" ]]; then
  echo "→ Installing SDDM silent theme..."
  sudo mkdir -p /usr/share/sddm/themes/
  sudo cp -r sddm/themes/silent /usr/share/sddm/themes/
  echo "   (You can set it in /etc/sddm.conf or nwg-look)"
fi
