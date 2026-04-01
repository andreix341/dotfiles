#!/bin/bash

# This script is for installing specific apps:
# hypr
# nvim - lazyvim
# noctalia
# fastfetch
# kitty

set -e

DISTRO=$(lsb_release -si)
DOTFILES_DIR="$HOME/.dotfiles"

# Propmt user which app to install

show_menu() {
  echo ""
  echo "------ Select an app to install ------"
  echo "1) Neovim (LazyVim)"
  echo "2) Hyprland"
  echo "3) Quit"
  echo ""
}

# Install nvim

install_neovim() {
  echo "Installing Neovim..."

  if ! command -v nvim &>/dev/null; then
    case $DISTRO in
    "Ubuntu")
      sudo apt update && sudo apt install -y neovim
      ;;
    "Fedora")
      sudo dnf install -y neovim
      ;;
    "Arch")
      sudo pacman -S --noconfirm neovim
      ;;
    *)
      echo "Unsupported distribution: $DISTRO"
      exit 1
      ;;
    esac
  fi

  local nvim_dir="$HOME/.config/nvim"
  local script_dir="$(dirname "$0")"

  if [ -L "$nvim_dir" ]; then
    rm "$nvim_dir"
  elif [ -d "$nvim_dir" ]; then
    mv "$nvim_dir" "$nvim_dir.bak"
  fi

  cp -r "$script_dir/nvim" "$nvim_dir"
  echo "Neovim installed with LazyVim config!"

}

# Install hyprland
intall_hyprland() {
  echo "Installing Hyprland..."
}

while true; do
  show_menu
  read -p "Enter your choice: " choice
  case $choice in
  1)
    install_neovim
    ;;
  2)
    install_hyprland
    ;;
  3)
    exit 0
    ;;
  *)
    echo "Invalid choice. Please try again."
    ;;
  esac
done
