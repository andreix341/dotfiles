#!/bin/bash

# This script is for configuring specific apps:
# hypr
# nvim - lazyvim
# noctalia (v5 and v4)
# fastfetch
# kitty
# tmux
# btop
# cava
# opencode

DISTRO=$(lsb_release -si)
SCRIPT_DIR="$(dirname "$0")"

GREEN='\033[0;32m'
NC='\033[0m'

success() {
  echo -e "\n${GREEN}${1}${NC}\n"
}

install_package() {
  local binary=$1
  local package=$2

  if command -v "$binary" &>/dev/null; then
    return 0
  fi

  read -p "$package is not installed. Install it? [Y/n] " answer
  case "${answer:-Y}" in
  [Yy]*)
    case $DISTRO in
    "Ubuntu")
      sudo apt update && sudo apt install -y "$package"
      ;;
    "Fedora")
      sudo dnf install -y "$package"
      ;;
    "Arch")
      sudo pacman -S --noconfirm "$package"
      ;;
    *)
      echo "Unsupported distribution: $DISTRO"
      exit 1
      ;;
    esac
    ;;
  *)
    echo "Skipping installation of $package."
    ;;
  esac
}

# Propmt user which app to configure

show_menu() {
  echo ""
  echo "------ Select an app to configure ------"
  echo "0) All"
  echo "q) Quit"
  echo ""
  echo "1) Neovim (LazyVim)"
  echo "2) Hyprland"
  echo "3) Noctalia v5"
  echo "4) Noctalia v4"
  echo "5) Fastfetch"
  echo "6) Kitty"
  echo "7) Tmux"
  echo "8) Btop"
  echo "9) Cava"
  echo "10) OpenCode"
  echo ""
}

# Configure nvim

configure_neovim() {
  echo "Configuring Neovim..."

  install_package nvim neovim

  local nvim_dir="$HOME/.config/nvim"

  if [ -L "$nvim_dir" ]; then
    rm "$nvim_dir"
  elif [ -d "$nvim_dir" ]; then
    mv "$nvim_dir" "$nvim_dir.bak.$(date +%Y%m%d-%H%M%S)"
  fi

  cp -r "$SCRIPT_DIR/nvim" "$nvim_dir"
  success "Neovim configured with LazyVim config!"
}

# Configure hyprland
configure_hyprland() {
  echo "Configuring Hyprland..."

  install_package hyprctl hyprland

  local hyprland_dir="$HOME/.config/hypr"

  if [ -L "$hyprland_dir" ]; then
    rm "$hyprland_dir"
  elif [ -d "$hyprland_dir" ]; then
    mv "$hyprland_dir" "$hyprland_dir.bak.$(date +%Y%m%d-%H%M%S)"
  fi

  cp -r "$SCRIPT_DIR/hypr" "$hyprland_dir"
  success "Hyprland configured!"
}

# Configure Noctalia v5

configure_noctalia_v5() {
  echo "Configuring Noctalia v5..."

  install_package noctalia noctalia

  local noctalia_dir="$HOME/.config/noctalia"

  if [ -L "$noctalia_dir" ]; then
    rm "$noctalia_dir"
  elif [ -d "$noctalia_dir" ]; then
    mv "$noctalia_dir" "$noctalia_dir.bak.$(date +%Y%m%d-%H%M%S)"
  fi

  cp -r "$SCRIPT_DIR/noctalia" "$noctalia_dir"
  success "Noctalia v5 configured!"
}

# Configure Noctalia v4

configure_noctalia_v4() {
  echo "Configuring Noctalia v4..."

  local noctalia_dir="$HOME/.config/quickshell/noctalia-shell"

  if [ -L "$noctalia_dir" ]; then
    rm "$noctalia_dir"
  elif [ -d "$noctalia_dir" ]; then
    mv "$noctalia_dir" "$noctalia_dir.bak.$(date +%Y%m%d-%H%M%S)"
    echo "Noctalia directory already exists. Backing up..."
  fi
  if ! command -v yay &>/dev/null; then
    echo "yay (AUR helper) not found. Skipping Noctalia v4 install."
    return 1
  fi
  yay -S --noconfirm noctalia-shell
  cp -r "$SCRIPT_DIR/noctalia-v4" "$noctalia_dir"
  success "Noctalia v4 configured!"
}

# Configure Fastfetch

configure_fastfetch() {
  echo "Configuring Fastfetch..."

  install_package fastfetch fastfetch

  local fastfetch_dir="$HOME/.config/fastfetch"

  if [ -L "$fastfetch_dir" ]; then
    rm "$fastfetch_dir"
  elif [ -d "$fastfetch_dir" ]; then
    mv "$fastfetch_dir" "$fastfetch_dir.bak.$(date +%Y%m%d-%H%M%S)"
  fi

  cp -r "$SCRIPT_DIR/fastfetch" "$fastfetch_dir"
  success "Fastfetch configured!"
}

# Configure Kitty

configure_kitty() {
  echo "Configuring Kitty..."

  install_package kitty kitty

  local kitty_dir="$HOME/.config/kitty"

  if [ -L "$kitty_dir" ]; then
    rm "$kitty_dir"
  elif [ -d "$kitty_dir" ]; then
    mv "$kitty_dir" "$kitty_dir.bak.$(date +%Y%m%d-%H%M%S)"
  fi

  cp -r "$SCRIPT_DIR/kitty" "$kitty_dir"
  success "Kitty configured!"
}

# Configure Tmux

configure_tmux() {
  echo "Configuring Tmux..."

  install_package tmux tmux

  local tmux_dir="$HOME/.config/tmux"

  if [ -L "$tmux_dir" ]; then
    rm "$tmux_dir"
  elif [ -d "$tmux_dir" ]; then
    mv "$tmux_dir" "$tmux_dir.bak.$(date +%Y%m%d-%H%M%S)"
  fi

  cp -r "$SCRIPT_DIR/tmux" "$tmux_dir"

  if [ ! -f "$tmux_dir/plugins/tpm/bin/init.tmux" ]; then
    git clone https://github.com/tmux-plugins/tpm "$tmux_dir/plugins/tpm"
  fi

  started_server=0
  if ! tmux has-session 2>/dev/null; then
    tmux start-server
    started_server=1
  fi
  "$tmux_dir/plugins/tpm/bin/install_plugins"
  [ "$started_server" = 1 ] && tmux kill-server 2>/dev/null

  success "Tmux configured!"
}

# Configure btop

configure_btop() {
  echo "Configuring btop..."

  install_package btop btop

  local btop_dir="$HOME/.config/btop"

  if [ -L "$btop_dir" ]; then
    rm "$btop_dir"
  elif [ -d "$btop_dir" ]; then
    mv "$btop_dir" "$btop_dir.bak.$(date +%Y%m%d-%H%M%S)"
  fi

  cp -r "$SCRIPT_DIR/btop" "$btop_dir"
  success "Btop configured!"
}

# Configure cava

configure_cava() {
  echo "Configuring cava..."

  install_package cava cava

  local cava_dir="$HOME/.config/cava"

  if [ -L "$cava_dir" ]; then
    rm "$cava_dir"
  elif [ -d "$cava_dir" ]; then
    mv "$cava_dir" "$cava_dir.bak.$(date +%Y%m%d-%H%M%S)"
  fi

  cp -r "$SCRIPT_DIR/cava" "$cava_dir"
  success "Cava configured!"
}

# Configure opencode

configure_opencode() {
  echo "Configuring opencode..."

  install_package opencode opencode

  local opencode_dir="$HOME/.config/opencode"

  if [ -L "$opencode_dir" ]; then
    rm "$opencode_dir"
  elif [ -d "$opencode_dir" ]; then
    mv "$opencode_dir" "$opencode_dir.bak.$(date +%Y%m%d-%H%M%S)"
  fi

  cp -r "$SCRIPT_DIR/opencode" "$opencode_dir"
  success "OpenCode configured!"
}

while true; do
  clear
  show_menu
  read -p "Enter your choice: " choice || break
  echo ""
  case $choice in
  0)
    configure_neovim
    configure_hyprland
    configure_noctalia_v5
    configure_noctalia_v4
    configure_fastfetch
    configure_kitty
    configure_tmux
    configure_btop
    configure_cava
    configure_opencode
    ;;
  1)
    configure_neovim
    ;;
  2)
    configure_hyprland
    ;;
  3)
    configure_noctalia_v5
    ;;
  4)
    configure_noctalia_v4
    ;;
  5)
    configure_fastfetch
    ;;
  6)
    configure_kitty
    ;;
  7)
    configure_tmux
    ;;
  8)
    configure_btop
    ;;
  9)
    configure_cava
    ;;
  10)
    configure_opencode
    ;;
  q)
    exit 0
    ;;
  *)
    echo "Invalid choice. Please try again."
    ;;
  esac
  read -p "Press Enter to continue... " _ || break
done
