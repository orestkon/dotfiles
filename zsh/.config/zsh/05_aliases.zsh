# ==============================================================================
# NAVIGATION & SYSTEM ALIASES
# ==============================================================================
alias vim='nvim'
alias v='nvim .'
alias c='clear'

# Fast directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ==============================================================================
# EZA ALIASES (MODERN LS)
# ==============================================================================
# Clean single column list (Icons + Git status only)
alias ls='eza --long --icons=auto --git --group-directories-first --no-filesize --no-time --no-user --no-permissions'

# Detailed single column list (Filesizes, modified dates, permissions)
alias ll='eza -lh --icons=auto --git --group-directories-first'

# Clean single column list including hidden files
alias la='eza -a --long --icons=auto --git --group-directories-first --no-filesize --no-time --no-user --no-permissions'

# Tree views (Depth level 2 and 3)
alias lt='eza -a --tree --level=2 --icons=auto'
alias lt3='eza -a --tree --level=3 --icons=auto'


# ==============================================================================
# AI AGENTS & CLI TOOLS
# ==============================================================================
alias cat='bat'
