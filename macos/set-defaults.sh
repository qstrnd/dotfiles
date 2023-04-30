#!/usr/bin/env bash

# Disable press-and-hold for keys in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

# Don't show hidden files
defaults write com.apple.Finder AppleShowAllFiles NO

# Show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable crash reporter
defaults write com.apple.CrashReporter DialogType none

# Expand save dialog
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Always open everything in Finder's list view
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show the ~/Library folder
chflags nohidden ~/Library

# Reload Finder
killall Finder