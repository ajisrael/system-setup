#!/bin/bash

set -e

echo "Installing basic development packages..."

sudo apt-get install -y \
    jq \
    ripgrep \
    fzf

echo "Basic tools installed successfully!"
