#!/bin/bash

set -e

echo "Installing programming languages and runtimes..."

# Install Node.js via NVM (get latest version)
NVM_VERSION=$(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install --lts
nvm use --lts

# Install Python and pip (non-interactive)
sudo apt-get install -y python3 python3-pip python3-venv

echo "Programming languages installed successfully!"
