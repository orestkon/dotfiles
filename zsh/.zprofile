# ==============================================================================
# HOMEBREW & SYSTEM PATHS
# ==============================================================================
eval "$(/opt/homebrew/bin/brew shellenv)"

# MacPorts Fallback
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export MANPATH="/opt/local/share/man:$MANPATH"


# ==============================================================================
# USER PATH & ENVIRONMENT EXPORTS
# ==============================================================================
# Prevent duplicate entries in PATH
typeset -U path

export BUN_INSTALL="$HOME/.bun"
export NVM_DIR="$HOME/.nvm"

path=(
  "$BUN_INSTALL/bin"
  "$HOME/bin"
  $path
)
