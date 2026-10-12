# ==============================================================================
# UNIVERSAL ENVIRONMENT VARIABLES
# ==============================================================================
export EDITOR="nvim"
export BAT_THEME="Catppuccin Macchiato"
export XDG_CONFIG_HOME="$HOME/.config"

# ==============================================================================
# SECRETS & LOCAL API KEYS
# ==============================================================================
if [ -f "$HOME/.gemini_key" ]; then
  export GEMINI_API_KEY="$(cat "$HOME/.gemini_key" | tr -d '\r\n')"
else
  echo "\033[33m[zsh] WARNING: ~/.gemini_key not found. Create this file with 'export GOOGLE_API_KEY=\"your_key\"' to enable OpenCode/Gemini API support.\033[0m"
fi
