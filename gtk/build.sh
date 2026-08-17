#!/bin/bash
# Install the Moonveil GTK theme: symlink into ~/.themes and wire up user configs.
set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
THEME="$REPO_DIR/Moonveil"
GTK4="$HOME/.config/gtk-4.0"
GTK3="$HOME/.config/gtk-3.0"

ln -sfn "$THEME" "$HOME/.themes/Moonveil"
ln -sfn "$THEME/gtk-4.0/assets" "$GTK4/assets"

echo '@import url("noctalia.css");' > "$GTK4/gtk.css"

echo "Moonveil GTK theme symlinked. gtk-theme-name is managed by noctalia (adw-gtk-theme)."
