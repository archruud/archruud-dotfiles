#!/bin/bash
# scripts/02-install-base-packages.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
LISTS_DIR="$REPO_ROOT/lists"

echo "Oppdaterer pakkedatabase..."
sudo pacman -Sy

echo ""
echo "Installerer grunnleggende pakker..."
sudo pacman -S --needed --noconfirm $(cat "$LISTS_DIR/base-packages.txt")

echo ""
echo "✓ Grunnpakker installert!"
