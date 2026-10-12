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

# Safety prompts for destructive operations
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'


# ==============================================================================
# EZA ALIASES (MODERN LS)
# ==============================================================================
# Clean single column list (Icons + Git status only)
alias ls='eza --long --color=always --icons=always --git --group-directories-first --no-filesize --no-time --no-user --no-permissions'

# Detailed single column list (Filesizes, modified dates, permissions)
alias ll='eza -lh --color=always --icons=always --git --group-directories-first'

# Clean single column list including hidden files
alias la='eza -a --long --color=always --icons=always --git --group-directories-first --no-filesize --no-time --no-user --no-permissions'

# Tree views (Depth level 2 and 3)
alias lt='eza -a --tree --level=2 --icons=always'
alias lt3='eza -a --tree --level=3 --icons=always'


# ==============================================================================
# AI AGENTS & CLI TOOLS
# ==============================================================================
alias opencode='opencode --agent=plan --continue'
alias cat='bat'
