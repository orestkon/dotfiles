# ==============================================================================
# OH MY POSH PROMPT CONFIGURATION
# ==============================================================================
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ${HOME}/.config/ohmyposh/zen.toml)"
fi
