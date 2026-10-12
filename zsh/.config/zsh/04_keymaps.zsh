# ==============================================================================
# VI MODE & ESSENTIALS
# ==============================================================================
# Enable Vi command line editing mode
bindkey -v

# Clear entire line backward
bindkey '^U' backward-kill-line


# ==============================================================================
# HISTORY SEARCH & NAVIGATION
# ==============================================================================
# Custom history search using Ctrl+P / Ctrl+N
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Up/Down Arrow history search matching typed prefix (e.g. type "git" + Up)
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search


# ==============================================================================
# MACOS WORD JUMPING & DELETION
# ==============================================================================
# Option + Arrow word navigation
bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word

# Option + Backspace word deletion
bindkey '^[^?' backward-kill-word
