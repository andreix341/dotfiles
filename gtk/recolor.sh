#!/bin/bash
# Recolor a Material-Black-Plum GTK theme to the Moonveil palette.
# Run from the repo root. Usage: ./recolor.sh /path/to/Material-Black-Plum /dest/Moonveil
set -e

SRC="${1:-$HOME/.themes/Material-Black-Plum}"
DEST="${2:-$(dirname "$0")/Moonveil}"

if [ ! -f "$SRC/index.theme" ]; then
  echo "Source theme not found: $SRC" >&2
  exit 1
fi

rm -rf "$DEST"
cp -r "$SRC" "$DEST"

# Moonveil recolor (accent purple family + status colors + near-black)
for f in cinnamon/cinnamon.css gnome-shell/gnome-shell.css gtk-3.0/gtk.css gtk-4.0/gtk.css; do
  sed -i \
    -e 's/#2b1e42/#241D33/g; s/#281d3c/#241D33/g; s/#221a31/#241D33/g' \
    -e 's/#673ab7/#C792EA/g; s/#7c53c7/#C6A0F6/g; s/#764cc4/#B5B9F0/g' \
    -e 's/#825bc9/#C792EA/g; s/#6a3cbf/#C792EA/g; s/#c58af9/#C6A0F6/g' \
    -e 's/#f7746a/#F06C6C/g; s/#f66156/#F06C6C/g; s/#f55a4e/#F06C6C/g; s/#f55246/#F06C6C/g; s/#f44336/#F06C6C/g' \
    -e 's/#ffeb3b/#E2A76F/g; s/#00e676/#5FB878/g; s/#09090a/#000000/g' \
    "$DEST/$f"
done

sed -i \
  -e 's/^Name=Material-Black-Plum$/Name=Moonveil/' \
  -e 's/^Comment=A Material Design theme$/Comment=A Moonveil-themed Material design theme/' \
  -e 's/^GtkTheme=Material-Black-Plum$/GtkTheme=Moonveil/' \
  "$DEST/index.theme"

echo "Moonveil GTK theme written to $DEST"
