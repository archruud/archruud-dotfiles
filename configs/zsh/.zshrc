# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ============================================================================
# THEME CONFIGURATION
# ============================================================================
ZSH_THEME="powerlevel10k/powerlevel10k"

# ============================================================================
# OH MY ZSH UPDATE CONFIGURATION
# ============================================================================
# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# ============================================================================
# PLUGINS - ALLE PÅ ÉN LINJE
# ============================================================================
plugins=(git zsh-autosuggestions zsh-syntax-highlighting colored-man-pages command-not-found)

# ============================================================================
# LOAD OH MY ZSH
# ============================================================================
source $ZSH/oh-my-zsh.sh

# ============================================================================
# USER CONFIGURATION
# ============================================================================

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nano'

# ============================================================================
# CUSTOM ALIASES
# ============================================================================

# ──────────────────────────────────────────────────────────────────────────
# FILVISNING MED EXA (moderne ls med farger og ikoner)
# ──────────────────────────────────────────────────────────────────────────
alias ls='exa -a --icons'                      # Vis alt som standard med ikoner
alias l='exa -la --icons --git'                # Detaljert visning av alt + Git-status
alias lt='exa --tree -a --icons --level=2'     # Trevisning med alt, begrenset dybde
alias lh='exa -la --icons --git --header'      # Detaljert + kolonnenavn øverst

# ──────────────────────────────────────────────────────────────────────────
# PAKKEBEHANDLING - YAY (søker i official + AUR)
# ──────────────────────────────────────────────────────────────────────────
alias i='yay -S --needed'                      # Installer fra ALT (official + AUR)
alias r='yay -Rns'                             # Fjern pakker komplett (med dependencies)
alias u='yay -Syu'                             # Oppdater hele systemet (official + AUR)
alias s='yay -Ss'                              # Søk i ALT (official + AUR)
alias q='yay -Q'                               # Alle installerte pakker
alias qe='yay -Qe'                             # Eksplisitt installerte pakker
alias qm='yay -Qm'                             # AUR/uoffisielle pakker (yay-installerte)
alias qn='yay -Qn'                             # Offisielle pakker (pacman repositories)

# ──────────────────────────────────────────────────────────────────────────
# PAKKEBEHANDLING - PACMAN (søker KUN i official repos)
# ──────────────────────────────────────────────────────────────────────────
alias ii='sudo pacman -S --needed'             # Installer KUN fra official repos
alias rr='sudo pacman -Rns'                    # Fjern med pacman
alias ss='pacman -Ss'                          # Søk KUN i official repos (ingen AUR)
alias uu='sudo pacman -Syu'                    # Oppdater KUN official pakker

# ──────────────────────────────────────────────────────────────────────────
# GIT SHORTCUTS
# ──────────────────────────────────────────────────────────────────────────
alias gc='git clone'                           # Git clone snarvei
alias gs='git status'                          # Git status
alias ga='git add'                             # Git add
alias gp='git push'                            # Git push
alias gl='git log --oneline'                   # Git log (kort format)

# ──────────────────────────────────────────────────────────────────────────
# NANO TEKSTEDITOR
# ──────────────────────────────────────────────────────────────────────────
alias n='nano -l'                              # Nano med linjenummer
alias nn='nano -liT 4'                         # Nano med linjenummer + auto-indent + pene tabs

# ──────────────────────────────────────────────────────────────────────────
# ANDRE NYTTIGE ALIASES
# ──────────────────────────────────────────────────────────────────────────
alias cat='bat'                                # Bat (bedre cat med syntax highlighting)
alias grep='grep --color=auto'                 # Grep med farger
alias ..='cd ..'                               # Opp én mappe
alias ...='cd ../..'                           # Opp to mapper
alias ....='cd ../../..'                       # Opp tre mapper
alias cls='clear'                              # Tøm terminal (Windows-stil)
alias h='history'                              # Vis kommando-historikk

# ──────────────────────────────────────────────────────────────────────────
# HYPRLAND/SYSTEM SHORTCUTS
# ──────────────────────────────────────────────────────────────────────────
alias hyprconf='nano ~/.config/hypr/hyprland.conf'              # Rediger Hyprland config
alias wayconf='nano ~/.config/waybar/config.jsonc'              # Rediger Waybar config
alias kitconf='nano ~/.config/kitty/kitty.conf'                 # Rediger Kitty config
alias zshconf='nano ~/.zshrc'                                   # Rediger zshrc
alias hyprrules='hyprctl clients'                               # Se window rules
alias hyprlayers='hyprctl layers'                               # Se layers
alias hyprinfo='hyprctl systeminfo'                             # Hyprland info
alias reload='source ~/.zshrc'                                  # Last inn zshrc på nytt

# ──────────────────────────────────────────────────────────────────────────
# SIKKERHETSKOPIERING OG SYSTEM
# ──────────────────────────────────────────────────────────────────────────
alias backup='rsync -avh --progress'           # Rsync med progress
alias df='df -h'                               # Disk usage human-readable
alias free='free -h'                           # Memory usage human-readable
alias ports='netstat -tulanp'                  # Vis åpne porter

# ============================================================================
# POWERLEVEL10K CONFIGURATION
# ============================================================================
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ============================================================================
# ALIAS OVERVIEW (for quick reference)
# ============================================================================
# 
# PAKKER - YAY (official + AUR):
#   i <pakke>    = Installer (yay - søker official + AUR)
#   r <pakke>    = Fjern
#   u            = Oppdater alt
#   s <pakke>    = Søk i ALT (official + AUR)
#
# PAKKER - PACMAN (KUN official):
#   ii <pakke>   = Installer (pacman - KUN official repos)
#   rr <pakke>   = Fjern med pacman
#   uu           = Oppdater kun official
#   ss <pakke>   = Søk KUN i official repos (ingen AUR)
#
# LISTING:
#   q            = Alle installerte pakker
#   qe           = Eksplisitt installerte
#   qm           = AUR pakker
#   qn           = Official pakker
#
# FILVISNING (EXA):
#   ls           = exa med ikoner
#   l            = detaljert + git
#   lt           = trevisning
#   lh           = med header
#
# GIT:
#   gc           = git clone
#   gs           = git status
#   ga           = git add
#   gp           = git push
#   gl           = git log
#
# NAVIGASJON:
#   ..           = cd ..
#   ...          = cd ../..
#   ....         = cd ../../..
#
# ============================================================================
