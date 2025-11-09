#
# ~/.zprofile
#

# Load zshrc if it exists
[[ -f ~/.zshrc ]] && . ~/.zshrc

# Auto-start Hyprland på TTY1
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    exec Hyprland
fi
