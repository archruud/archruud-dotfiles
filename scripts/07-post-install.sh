#!/bin/bash
# scripts/07-post-install.sh

set -e

echo "Kjører post-install konfigurasjon..."
echo ""

# Dolphin + Kitty integrasjon
echo "Konfigurerer Dolphin til å bruke Kitty..."
if [ ! -L /usr/share/applications/org.kde.konsole.desktop ]; then
    sudo ln -sf /usr/share/applications/kitty.desktop /usr/share/applications/org.kde.konsole.desktop
    echo "✓ Dolphin-Kitty symlink opprettet"
fi

# XDG meny fix
echo "Oppdaterer XDG meny-cache..."
XDG_MENU_PREFIX=arch- kbuildsycoca6 &> /dev/null || true
echo "✓ XDG meny oppdatert"

# Execute permissions på scripts
echo "Setter execute-permissions på scripts..."
chmod +x "$HOME/.config/hypr/scripts/"*.sh 2>/dev/null || true
echo "✓ Script permissions satt"

# Font cache
echo "Oppdaterer font cache..."
fc-cache -fv &> /dev/null
echo "✓ Font cache oppdatert"

# Lag fuzzel-hyprpicker mapper
echo "Oppretter fuzzel-hyprpicker directories..."
mkdir -p "$HOME/.config/fuzzel-hyprpicker/icons"
touch "$HOME/.config/fuzzel-hyprpicker/colors.txt"
echo "✓ Fuzzel-hyprpicker directories opprettet"

echo ""
echo "✓ Post-install konfigurasjon fullført!"
