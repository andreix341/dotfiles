#!/bin/bash

# This script is for configuring specific apps:
# hypr
# nvim - lazyvim
# noctalia
# fastfetch
# kitty
# tmux

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
  echo "3) Noctalia"
  echo "4) Fastfetch"
  echo "5) Kitty"
  echo "6) Tmux"
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

# Configure Noctalia

configure_noctalia() {
  echo "Configuring Noctalia..."

  local noctalia_dir="$HOME/.config/quickshell/noctalia-shell"

  if [ -d "$noctalia_dir" ]; then
    mv "$noctalia_dir" "$noctalia_dir.bak.$(date +%Y%m%d-%H%M%S)"
    echo "Noctalia directory already exists. Backing up..."

  fi
  if ! command -v yay &>/dev/null; then
    echo "yay (AUR helper) not found. Skipping Noctalia install."
    return 1
  fi
  yay -S --noconfirm noctalia-shell
  cp -r "$SCRIPT_DIR/noctalia" "$noctalia_dir"
  success "Noctalia configured!"
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

while true; do
  clear
  show_menu
  read -p "Enter your choice: " choice || break
  echo ""
  case $choice in
  0)
    configure_neovim
    configure_hyprland
    configure_noctalia
    configure_fastfetch
    configure_kitty
    configure_tmux
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
    configure_tmux
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
