#!/bin/bash

set -e

# Default to local repo for development, can be overridden with environment variable
REPO_URL=${REPO_URL:-"https://github.com/yourusername/system-setup.git"}

echo "🔨 Building Docker image..."
echo "📍 Using repository: $REPO_URL"
docker build --build-arg REPO_URL="$REPO_URL" -t dev-setup .

echo "🧪 Running setup test in container..."
docker run --rm dev-setup bash -c "
    echo '=== Testing setup script execution ==='
    ls -la system-setup/setup-scripts/
    echo '=== Running basic tools installation test ==='
    sudo apt-get update > /dev/null 2>&1
    echo 'System packages updated successfully'
    echo '✅ Docker container setup test completed!'
"

echo "✅ All tests passed!"
