#!/bin/bash
# scripts/03-install-dankmaterialshell.sh

set -e

echo "Sjekker om DankMaterialShell er installert..."
if command -v dms &> /dev/null; then
    echo "✓ DankMaterialShell er allerede installert"
    read -p "Vil du reinstallere? (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 0
    fi
fi

echo ""
echo "Installerer DankMaterialShell..."
echo "Dette kan ta noen minutter..."
echo ""

# Kjør DankMaterialShell one-line installer
curl -fsSL https://install.danklinux.com | sh

echo ""
echo "✓ DankMaterialShell installert!"
echo ""
echo "VIKTIG: DMS har installert:"
echo "- dankmaterialshell (desktop shell)"
echo "- dms (backend og IPC)"
echo "- dgop (system monitoring)"
echo "- dsearch (file search)"
echo "- matugen (theming)"
echo ""
