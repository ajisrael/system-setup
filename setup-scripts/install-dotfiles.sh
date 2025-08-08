#!/bin/bash

set -e

echo "Installing dotfiles..."

# Create backup directory for existing dotfiles
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Function to install a dotfile
install_dotfile() {
    local source_file="$1"
    local target_file="$HOME/$2"
    
    # Backup existing file if it exists
    if [ -f "$target_file" ]; then
        echo "Backing up existing $2 to $BACKUP_DIR"
        cp "$target_file" "$BACKUP_DIR/"
    fi
    
    # Copy dotfile from repo to home directory
    echo "Installing $2"
    cp "$source_file" "$target_file"
}

# Install each dotfile from repo
install_dotfile "./dotfiles/.bashrc" ".bashrc"
install_dotfile "./dotfiles/.zshrc" ".zshrc"
install_dotfile "./dotfiles/.tmux.conf" ".tmux.conf"

echo "Dotfiles installed successfully!"
echo "Backups of existing files saved to: $BACKUP_DIR"