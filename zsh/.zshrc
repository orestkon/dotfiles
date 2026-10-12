# ==============================================================================
# ZSH INTERACTIVE ENTRY POINT (~/.zshrc)
# ==============================================================================

ZSH_CONFIG_DIR="$HOME/.config/zsh"

# Automatically source all numbered configuration files in order
if [ -d "$ZSH_CONFIG_DIR" ]; then
  for file in "$ZSH_CONFIG_DIR"/[0-9][0-9]_*.zsh(N); do
    source "$file"
  done
fi

fastfetch --logo-type kitty
