# ==============================================================================
# SHELL HISTORY CONFIGURATION
# ==============================================================================
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE

# History options
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups


# ==============================================================================
# GENERAL SHELL OPTIONS
# ==============================================================================
setopt auto_cd              # Auto-cd into directory if typed directly
setopt interactive_comments # Allow comments (#) in interactive command lines
setopt no_beep              # Silence terminal beeps
setopt glob_complete        # Interactive completion menu on wildcard tab-completion


# ==============================================================================
# COMPLETION SYSTEM STYLING (ZSTYLE)
# ==============================================================================
# Bi-directional case-insensitive & smart character matching (e.g. foo-bar -> foo_bar)
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*'

# Use LS_COLORS for colored completion suggestions
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Automatically pick up new executables in $PATH without restarting shell
zstyle ':completion:*' rehash true

# Disable standard Zsh menu select in favor of fzf-tab
zstyle ':completion:*' menu no

# fzf-tab directory & file previews using eza and bat
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --tree --color=always $realpath | head -200'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --tree --color=always $realpath | head -200'
zstyle ':fzf-tab:complete:*:*' fzf-preview 'bat --color=always --line-range :50 {} 2>/dev/null || eza --tree --color=always {} 2>/dev/null'
