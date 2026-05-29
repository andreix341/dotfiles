#!/bin/bash

# This script is for configuring specific apps:
# hypr
# nvim - lazyvim
# noctalia
# fastfetch
# kitty

set -e

DISTRO=$(lsb_release -si)
SCRIPT_DIR="$(dirname "$0")"

# Propmt user which app to configure

show_menu() {
  echo ""
  echo "------ Select an app to configure ------"
  echo "0) All"
  echo ""
  echo "1) Neovim (LazyVim)"
  echo "2) Hyprland"
  echo "3) Noctalia"
  echo "4) Fastfetch"
  echo "5) Kitty"
  echo "6) Quit"
  echo ""
}

# Configure nvim

configure_neovim() {
  echo "Configuring Neovim..."

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
  echo "Neovim configured with LazyVim config!"
  echo ""
}

# Configure hyprland
configure_hyprland() {
  echo "Configuring Hyprland..."

  if ! command -v hyprctl &>/dev/null; then
    case $DISTRO in
    "Ubuntu")
      sudo apt update && sudo apt install -y hyprland
      ;;
    "Fedora")
      sudo dnf install -y hyprland
      ;;
    "Arch")
      sudo pacman -S --noconfirm hyprland
      ;;
    *)
      echo "Unsupported distribution: $DISTRO"
      exit 1
      ;;
    esac
  fi

  local hyprland_dir="$HOME/.config/hypr"

  if [ -L "$hyprland_dir" ]; then
    rm "$hyprland_dir"
  elif [ -d "$hyprland_dir" ]; then
    mv "$hyprland_dir" "$hyprland_dir.bak"
  fi

  cp -r "$SCRIPT_DIR/hyprland" "$hyprland_dir"
  echo "Hyprland configured!"
  echo ""
}

# Configure Noctalia

configure_noctalia() {
  echo "Configuring Noctalia..."

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
  echo "Noctalia configured!"
  echo ""
}

# Configure Fastfetch

configure_fastfetch() {
  echo "Configuring Fastfetch..."

  if ! command -v fastfetch &>/dev/null; then
    case $DISTRO in
    "Ubuntu")
      sudo apt update && sudo apt install -y fastfetch
      ;;
    "Fedora")
      sudo dnf install -y fastfetch
      ;;
    "Arch")
      sudo pacman -S --noconfirm fastfetch
      ;;
    *)
      echo "Unsupported distribution: $DISTRO"
      exit 1
      ;;
    esac
  fi

  local fastfetch_dir="$HOME/.config/fastfetch"

  if [ -L "$fastfetch_dir" ]; then
    rm "$fastfetch_dir"
  elif [ -d "$fastfetch_dir" ]; then
    mv "$fastfetch_dir" "$fastfetch_dir.bak"
  fi

  cp -r "$SCRIPT_DIR/fastfetch" "$fastfetch_dir"
  echo "Fastfetch configured!"
  echo ""
}

# Configure Kitty

configure_kitty() {
  echo "Configuring Kitty..."

  if ! command -v kitty &>/dev/null; then
    case $DISTRO in
    "Ubuntu")
      sudo apt update && sudo apt install -y kitty
      ;;
    "Fedora")
      sudo dnf install -y kitty
      ;;
    "Arch")
      sudo pacman -S --noconfirm kitty
      ;;
    *)
      echo "Unsupported distribution: $DISTRO"
      exit 1
      ;;
    esac
  fi

  local kitty_dir="$HOME/.config/kitty"

  if [ -L "$kitty_dir" ]; then
    rm "$kitty_dir"
  elif [ -d "$kitty_dir" ]; then
    mv "$kitty_dir" "$kitty_dir.bak"
  fi

  cp -r "$SCRIPT_DIR/kitty" "$kitty_dir"
  echo "Kitty configured!"
  echo ""
}

while true; do
  show_menu
  read -p "Enter your choice: " choice
  case $choice in
  0)
    configure_neovim
    configure_hyprland
    configure_noctalia
    configure_fastfetch
    configure_kitty
    ;;
  1)
    configure_neovim
    ;;
  2)
    configure_hyprland
    ;;
  3)
    configure_noctalia
    ;;
  4)
    configure_fastfetch
    ;;
  5)
    configure_kitty
    ;;

  6)
    exit 0
    ;;
  *)
    echo "Invalid choice. Please try again."
    ;;
  esac
done
