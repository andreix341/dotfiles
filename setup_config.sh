#!/bin/bash

# This script is for installing specific apps:
# hypr
# nvim - lazyvim
# noctalia
# fastfetch
# kitty

set -e

DISTRO=$(lsb_release -si)
SCRIPT_DIR="$(dirname "$0")"

# Propmt user which app to install

show_menu() {
  echo ""
  echo "------ Select an app to install ------"
  echo "1) Neovim (LazyVim)"
  echo "2) Hyprland"
  echo "3) Noctalia"
  echo "4) Fastfetch"
  echo "5) Kitty"
  echo "6) Quit"
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

  if [ -L "$nvim_dir" ]; then
    rm "$nvim_dir"
  elif [ -d "$nvim_dir" ]; then
    mv "$nvim_dir" "$nvim_dir.bak"
  fi

  cp -r "$SCRIPT_DIR/nvim" "$nvim_dir"
  echo "Neovim installed with LazyVim config!"

}

# Install hyprland
install_hyprland() {
  echo "Configuring Hyprland..."
  local hyprland_dir="$HOME/.config/hypr"

  if [ -L "$hyprland_dir" ]; then
    rm "$hyprland_dir"
  elif [ -d "$hyprland_dir" ]; then
    mv "$hyprland_dir" "$hyprland_dir.bak"
  fi

  cp -r "$SCRIPT_DIR/hyprland" "$hyprland_dir"
  echo "Hyprland configured!"
}

# Install Noctalia

install_noctalia() {
  echo "Installing Noctalia..."

  local noctalia_dir="$HOME/.config/quickshell/noctalia-shell"

  if [ -d "$noctalia_dir" ]; then
    mv "$noctalia_dir" "$noctalia_dir.bak"
    echo "Noctalia directory already exists. Backing up..."

  fi
  if ! command -v yay &>/dev/null; then
    echo "yay (AUR helper) not found. Please install it first."
    exit 1
  fi
  yay -S noctalia-shell
  cp -r "$SCRIPT_DIR/noctalia-shell" "$noctalia_dir"
  echo "Noctalia installed!"

}

# Install Fastfetch

install_fastfetch() {
  echo "Installing Fastfetch..."
}

# Install Kitty

install_kitty() {
  echo "Installing Kitty..."
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
    install_noctalia
    ;;
  4)
    install_fastfetch
    ;;
  5)
    install_kitty
    ;;

  6)
    exit 0
    ;;
  *)
    echo "Invalid choice. Please try again."
    ;;
  esac
done
