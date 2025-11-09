#!/bin/bash
# archruud-dotfiles installer (DankMaterialShell edition)
# For Arch Linux + Hyprland + DankMaterialShell på Dell Pro 16

set -e  # Avslutt ved feil

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_DIR="$SCRIPT_DIR/scripts"

echo "================================================="
echo "ARCHRUUD DOTFILES INSTALLER"
echo "DankMaterialShell Edition"
echo "================================================="
echo ""
echo "Dette scriptet vil:"
echo "1. Installere yay (AUR helper)"
echo "2. Installere grunnleggende pakker"
echo "3. Installere DankMaterialShell"
echo "4. Installere tilleggspakker"
echo "5. Sette opp ZSH med Oh My Zsh og Powerlevel10k"
echo "6. Linke konfigurasjonsfiler"
echo "7. Kjøre post-install konfigurasjon"
echo ""
read -p "Vil du fortsette? (y/n): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
fi

# Kjør alle subscripts
echo ""
echo "[1/7] Installerer yay..."
bash "$SCRIPTS_DIR/01-install-yay.sh"

echo ""
echo "[2/7] Installerer grunnpakker..."
bash "$SCRIPTS_DIR/02-install-base-packages.sh"

echo ""
echo "[3/7] Installerer DankMaterialShell..."
bash "$SCRIPTS_DIR/03-install-dankmaterialshell.sh"

echo ""
echo "[4/7] Installerer tilleggspakker..."
bash "$SCRIPTS_DIR/04-install-additional-packages.sh"

echo ""
echo "[5/7] Setter opp ZSH..."
bash "$SCRIPTS_DIR/05-setup-zsh.sh"

echo ""
echo "[6/7] Linker konfigurasjonsfiler..."
bash "$SCRIPTS_DIR/06-link-configs.sh"

echo ""
echo "[7/7] Kjører post-install..."
bash "$SCRIPTS_DIR/07-post-install.sh"

echo ""
echo "================================================="
echo "INSTALLASJON FULLFØRT!"
echo "================================================="
echo ""
echo "VIKTIG: Du må logge ut og inn igjen."
echo ""
echo "Etter innlogging vil DankMaterialShell starte automatisk."
echo ""
echo "Test at alt fungerer:"
echo "- SUPER + Space: Launcher"
echo "- SUPER + P: Color picker"
echo "- SUPER + Return: Terminal"
echo "- SUPER + Tab: Overview"
echo ""
