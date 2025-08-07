#!/bin/bash

set -e

echo "Installing development tools..."

sudo apt-get install -y \
    neovim \
    tmux \

echo "Development tools installed successfully!"
