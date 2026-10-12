# ==============================================================================
# BUN COMPLETIONS, ZOXIDE & THE FUCK
# ==============================================================================
# Load Bun shell completions if available
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# Initialize Zoxide smarter cd replacement
eval "$(zoxide init --cmd cd zsh)"

# Initialize 'thefuck' command correction alias
eval $(thefuck --alias)
