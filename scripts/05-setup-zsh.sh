#!/bin/bash
# scripts/05-setup-zsh.sh

set -e

echo "Setter opp ZSH..."

# Bytt default shell
if [ "$SHELL" != "/usr/bin/zsh" ]; then
    echo "Bytter standard shell til zsh..."
    chsh -s /usr/bin/zsh
    echo "✓ Standard shell endret"
fi

# Installer Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installerer Oh My Zsh..."
    RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    echo "✓ Oh My Zsh installert"
else
    echo "✓ Oh My Zsh allerede installert"
fi

# Installer Powerlevel10k
P10K_DIR="$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
if [ ! -d "$P10K_DIR" ]; then
    echo "Installerer Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
    echo "✓ Powerlevel10k installert"
else
    echo "✓ Powerlevel10k allerede installert"
fi

# Installer zsh-autosuggestions
AUTOSUGG_DIR="$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
if [ ! -d "$AUTOSUGG_DIR" ]; then
    echo "Installerer zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$AUTOSUGG_DIR"
    echo "✓ zsh-autosuggestions installert"
else
    echo "✓ zsh-autosuggestions allerede installert"
fi

# Installer zsh-syntax-highlighting
SYNTAX_DIR="$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
if [ ! -d "$SYNTAX_DIR" ]; then
    echo "Installerer zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$SYNTAX_DIR"
    echo "✓ zsh-syntax-highlighting installert"
else
    echo "✓ zsh-syntax-highlighting allerede installert"
fi

echo ""
echo "✓ ZSH setup fullført!"
