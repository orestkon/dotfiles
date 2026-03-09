# MacOS -- Homebrew installed apps available to PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# 1. Smart Path Management (Unique array prevents duplicates)
typeset -U path
export BUN_INSTALL="$HOME/.bun"

# 2. Add your custom folders to the path array
# (Note: lower-case 'path' is a zsh array linked to upper-case 'PATH')
path=(
  "$BUN_INSTALL/bin"
  "$HOME/bin"
  $path
)

# --- BUN COMPLETIONS ---
# This keeps your 'bun' commands tab-completable
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

# Export default configurations
export EDITOR="nvim"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "${ZINIT_HOME}" ]; then
	mkdir -p "$(dirname ${ZINIT_HOME})"
	git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT_HOME}"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets (Search more about these)
zinit snippet OMZP::git

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# To customize prompt, edit ~/.config/ohmyposh/zen.toml
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
	eval "$(oh-my-posh init zsh --config ${HOME}/.config/ohmyposh/zen.toml)"
fi

# Keybindings -- (vim?)
bindkey -v
bindkey '^k' history-search-backward
bindkey '^j' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias vim='nvim'
alias v='nvim .'
alias c='clear'

alias opencode='opencode --agent=plan --continue'

# General replacement
alias ls='eza --color=always --long --git --icons=always --no-filesize --no-time --no-user --no-permissions'

# Detailed list (The "Gold Standard" eza view)
alias ll='eza -lh --icons=always --grid --group-directories-first --git'

# All files including hidden
alias la='eza -a --color=always --long --git --icons=always --no-filesize --no-time --no-user --no-permissions'

# Tree view (replaces the 'tree' command)
alias lt='eza -a --tree --level=2 --icons=always'

## Shell integrations

# Setup fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# -- Use fd instead of find --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal.
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
	fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion.
_fzf_compgen_dir() {
	fd --type=d --hidden --exclude .git . "$1"
}

# NOTE: Find a better place for this repo
source ~/fzf-git.sh/fzf-git.sh

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# -- NVM (Node Version Manager) --
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# -- Zoxide --
eval "$(zoxide init --cmd cd zsh)"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

export BAT_THEME=gruvbox-dark

# -- The fuck --
eval $(thefuck --alias)

neofetch

# bun completions
[ -s "/Users/orestkon/.bun/_bun" ] && source "/Users/orestkon/.bun/_bun"
