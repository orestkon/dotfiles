# ==============================================================================
# HOMEBREW
# ==============================================================================
# Apple Silicon only; Linux/WSL use their native package managers.
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi


# ==============================================================================
# USER PATH & ENVIRONMENT EXPORTS
# ==============================================================================
# Prevent duplicate entries in PATH
typeset -U path

export NVM_DIR="$HOME/.nvm"
export BUN_INSTALL="$HOME/.bun"

path=(
  "$BUN_INSTALL/bin"
  "$HOME/.cargo/bin"
  "$HOME/.local/bin"
  $path
)
