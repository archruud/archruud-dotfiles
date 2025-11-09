#!/bin/bash
# scripts/01-install-yay.sh

set -e

echo "Sjekker om yay er installert..."
if command -v yay &> /dev/null; then
    echo "✓ yay er allerede installert"
    exit 0
fi

echo "Installerer yay..."
BUILD_DIR="/tmp/yay-build"
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

cd
rm -rf "$BUILD_DIR"

echo "✓ yay installert!"
