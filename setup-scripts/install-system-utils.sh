#!/bin/bash

set -e

echo "Installing system utilities..."

# Create local bin directory if it doesn't exist
mkdir -p ~/.local/bin

# Copy tmux-sessionizer to local bin
cp ./system-scripts/tmux-sessionizer.sh ~/.local/bin/tmux-sessionizer
chmod +x ~/.local/bin/tmux-sessionizer

# Add ~/.local/bin to PATH in both bash and zsh if not already present
if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' ~/.bashrc; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
fi

if [ -f ~/.zshrc ] && ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' ~/.zshrc; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
fi

echo "System utilities installed successfully!"
