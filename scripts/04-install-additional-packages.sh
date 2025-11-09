#!/bin/bash
# scripts/04-install-additional-packages.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
LISTS_DIR="$REPO_ROOT/lists"

echo "Installerer tilleggspakker (browsers, editors, etc.)..."
sudo pacman -S --needed --noconfirm $(cat "$LISTS_DIR/additional-packages.txt")

echo ""
echo "Installerer AUR pakker..."
yay -S --needed --noconfirm $(cat "$LISTS_DIR/aur-packages.txt")

echo ""
echo "✓ Alle tilleggspakker installert!"
