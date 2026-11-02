# ==============================================================================
# NAVIGATION & SYSTEM
# ==============================================================================
alias vim='nvim'
alias c='clear'

# Fast directory navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ==============================================================================
# GIT
# ==============================================================================

# Status & Staging
alias gst='git status'
alias ga='git add'
alias gaa='git add --all'
alias gau='git add --update'
alias gunstage='git restore --staged'

# Commits
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'

# History
alias lg='git log --graph --oneline --decorate'

# Diff & Inspection
alias gd='git diff'
alias gds='git diff --staged'
alias gshow='git show'

# ==============================================================================
# EZA (MODERN LS)
# ==============================================================================
# Clean single column list (Icons + Git status only)
alias ls='eza --long --icons=auto --git --group-directories-first --no-filesize --no-time --no-user --no-permissions'

# Detailed single column list (Filesizes, modified dates, permissions)
alias ll='eza -lh --icons=auto --git --group-directories-first'

# Clean single column list including hidden files
alias la='eza -a --long --icons=auto --git --group-directories-first --no-filesize --no-time --no-user --no-permissions'
alias lal='eza -lah --long --icons=auto --git --group-directories-first'

# Tree views (Depth level 2 and 3)
alias lt='eza -a --tree --level=2 --icons=auto'
alias lt3='eza -a --tree --level=3 --icons=auto'


# ==============================================================================
# AI AGENTS & CLI TOOLS
# ==============================================================================
alias cat='bat'
