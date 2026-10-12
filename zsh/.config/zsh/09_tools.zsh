# ==============================================================================
# BUN COMPLETIONS, ZOXIDE & THE FUCK
# ==============================================================================
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"
eval "$(zoxide init --cmd cd zsh)"
eval $(thefuck --alias)
