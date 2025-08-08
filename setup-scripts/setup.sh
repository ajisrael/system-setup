#!/bin/bash

set -e

echo "🚀 Starting development environment setup..."

echo "📦 Updating system packages..."
sudo apt-get update && sudo apt-get upgrade -y

echo "🕐 Setting system time and location 🌎"
echo 'America/Detroit' | sudo tee /etc/timezone
sudo ln -fs /usr/share/zoneinfo/America/Detroit /etc/localtime

echo "🔧 Installing basic development tools..."
./setup-scripts/install-basics.sh

echo "💻 Installing programming languages..."
./setup-scripts/install-languages.sh

echo "🛠️  Installing development tools..."
./setup-scripts/install-dev-tools.sh

echo "🖥️ Setting up shell customizations..."
./setup-scripts/setup-shell.sh

echo "📄 Installing dotfiles..."
./setup-scripts/install-dotfiles.sh

echo "⚙️ Installing system utilities..."
./setup-scripts/install-system-utils.sh

echo "✅ Development environment setup complete!"
