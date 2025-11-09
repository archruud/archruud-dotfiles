#!/bin/bash
# scripts/06-link-configs.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
CONFIGS_DIR="$REPO_ROOT/configs"
BACKUP_DIR="$REPO_ROOT/backup"

# Lag backup directory
mkdir -p "$BACKUP_DIR"

# Funksjon for backup og symlink
link_config() {
    local src="$1"
    local dest="$2"
    
    if [ ! -e "$src" ]; then
        echo "⚠ Advarsel: $src eksisterer ikke, hopper over"
        return
    fi
    
    mkdir -p "$(dirname "$dest")"
    
    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        local backup_name="$(basename "$dest").backup.$(date +%Y%m%d_%H%M%S)"
        echo "  Backup: $dest -> $BACKUP_DIR/$backup_name"
        mv "$dest" "$BACKUP_DIR/$backup_name"
    fi
    
    if [ -L "$dest" ]; then
        rm "$dest"
    fi
    
    ln -sf "$src" "$dest"
    echo "  ✓ Linket: $dest -> $src"
}

echo "Linker konfigurasjonsfiler..."
echo ""

# ZSH configs (hjemmemappe)
echo "ZSH:"
link_config "$CONFIGS_DIR/zsh/.zshrc" "$HOME/.zshrc"
link_config "$CONFIGS_DIR/zsh/.zprofile" "$HOME/.zprofile"
link_config "$CONFIGS_DIR/zsh/.p10k.zsh" "$HOME/.p10k.zsh"

echo ""
# DankMaterialShell
echo "DankMaterialShell:"
link_config "$CONFIGS_DIR/DankMaterialShell/settings.json" "$HOME/.config/DankMaterialShell/settings.json"
if [ -f "$CONFIGS_DIR/DankMaterialShell/firefox.css" ]; then
    link_config "$CONFIGS_DIR/DankMaterialShell/firefox.css" "$HOME/.config/DankMaterialShell/firefox.css"
fi

echo ""
# Hyprland
echo "Hyprland:"
link_config "$CONFIGS_DIR/hypr/hyprland.conf" "$HOME/.config/hypr/hyprland.conf"
link_config "$CONFIGS_DIR/hypr/scripts" "$HOME/.config/hypr/scripts"

echo ""
# Kitty
echo "Kitty:"
link_config "$CONFIGS_DIR/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"

echo ""
# Swappy
echo "Swappy:"
link_config "$CONFIGS_DIR/swappy/config" "$HOME/.config/swappy/config"

echo ""
# ZED
echo "ZED:"
link_config "$CONFIGS_DIR/zed/settings.json" "$HOME/.config/zed/settings.json"

echo ""
echo "✓ Alle konfigurasjonsfiler linket!"
