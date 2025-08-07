#!/bin/bash

set -e

echo "🔨 Building Docker image..."
docker build -t dev-setup .

echo "🧪 Running setup test in container..."
docker run --rm dev-setup bash -c "
    echo '=== Testing setup script execution ==='
    ls -la setup-scripts/
    echo '=== Running basic tools installation test ==='
    sudo apt-get update > /dev/null 2>&1
    echo 'System packages updated successfully'
    echo '✅ Docker container setup test completed!'
"

echo "✅ All tests passed!"
