#!/bin/bash

# --- 1. DETECT OPERATING SYSTEM ---
OS_TYPE="unknown"
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS_TYPE="macos"
elif [[ -f /etc/fedora-release ]]; then
    OS_TYPE="fedora"
elif [[ -f /etc/arch-release ]]; then
    OS_TYPE="arch"
elif [[ -f /etc/debian_version ]]; then
    OS_TYPE="debian"
fi

echo "🖥️ System Detected: $OS_TYPE"

# --- 2. INSTALL PACKAGE MANAGER & CORE TOOLS ---
case $OS_TYPE in
    macos)
        if ! command -v brew &> /dev/null; then
            echo "🍺 Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
        ;;
    fedora)
        echo "🎩 Updating DNF..."
        sudo dnf install -y git curl stow nvim tmux zsh
        ;;
    arch)
        echo "🏹 Updating Pacman..."
        sudo pacman -Syu --noconfirm git stow neovim tmux zsh
        ;;
    debian)
        echo "🌀 Updating APT..."
        sudo apt update && sudo apt install -y git curl stow nvim tmux zsh
        ;;
esac

# --- 3. CLONE DOTFILES ---
DOTFILES_DIR="$HOME/dotfiles"
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "📂 Cloning dotfiles..."
    git clone https://github.com/orestkon/dotfiles.git "$DOTFILES_DIR"
else
    echo "🔄 Pulling latest changes..."
    git -C "$DOTFILES_DIR" pull
fi

# --- 4. APP INSTALLATION ---
if [[ "$OS_TYPE" == "macos" ]]; then
    if [ -f "$DOTFILES_DIR/Brewfile" ]; then
        echo "🍻 Installing apps from Brewfile..."
        brew bundle --file="$DOTFILES_DIR/Brewfile"
    fi
fi

# --- 5. PERMISSIONS ---
if [ -d "$DOTFILES_DIR/scripts" ]; then
    echo "🔐 Making scripts executable..."
    find "$DOTFILES_DIR/scripts" -type f -exec chmod +x {} +
fi

# --- 6. SMART STOW WITH IGNORE ---
echo "🔗 Starting Smart Stow..."
cd "$DOTFILES_DIR"

INTERNAL_IGNORE=(".git" ".stow-ignore" ".." ".")
USER_IGNORES=()
if [ -f ".stow-ignore" ]; then
    while IFS= read -r line || [[ -n "$line" ]]; do
        [[ -z "$line" || "$line" =~ ^# ]] && continue
        USER_IGNORES+=("$line")
    done < ".stow-ignore"
fi

for dir in */; do
    target=${dir%/}
    should_ignore=false

    for ign in "${INTERNAL_IGNORE[@]}"; do
        if [[ "$target" == "$ign" ]]; then
            should_ignore=true
            break
        fi
    done

    for ign in "${USER_IGNORES[@]}"; do
        if [[ "$target" == "$ign" ]]; then
            should_ignore=true
            break
        fi
    done

    if [ "$should_ignore" = false ]; then
        echo "📦 Stowing: $target"
        stow "$target"
    else
        echo "⏭️  Skipping: $target"
    fi
done

# --- 7. APPLY MACOS SPECIFIC SETTINGS ---
if [[ "$OS_TYPE" == "macos" ]]; then
    MACOS_CONFIG="$DOTFILES_DIR/scripts/macosSettings.sh"
    if [ -f "$MACOS_CONFIG" ]; then
        echo "🍎 Applying macOS system preferences..."
        source "$MACOS_CONFIG"
    else
        echo "⚠️ macosSettings.sh not found in $DOTFILES_DIR/scripts/. Skipping."
    fi
fi

echo "🏁 Environment setup complete."
