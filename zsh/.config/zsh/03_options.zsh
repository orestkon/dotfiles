# ==============================================================================
# SHELL HISTORY CONFIGURATION
# ==============================================================================
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

# History options
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# ==============================================================================
# COMPLETION SYSTEM STYLING (ZSTYLE)
# ==============================================================================
# Case-insensitive completion matching (typing "cd doc" matches "Documents")
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Use LS_COLORS for colored completion suggestions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Disable standard Zsh menu select in favor of fzf-tab
zstyle ':completion:*' menu no

# fzf-tab directory previews using eza
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --tree --color=always $realpath | head -200'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --tree --color=always $realpath | head -200'
