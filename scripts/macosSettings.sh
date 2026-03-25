#!/bin/bash

echo "🚀 Improving macOS UI..."

# 1. Faster Mission Control
defaults write com.apple.dock expose-animation-duration -float 0.1

# 2. Instant Dock Hide/Show
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.1
defaults write com.apple.dock autohide -bool true

# 3. Show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true

# 4. Apply changes
killall Dock
killall Finder

echo "✅ Done. Environment is ready."
