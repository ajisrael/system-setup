#!/bin/bash

set -e

echo "Setting up shell customizations..."

# Install Oh My Zsh  
sudo apt-get install -y zsh
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "Shell customizations completed!"
