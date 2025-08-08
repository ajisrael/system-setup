#!/bin/bash

set -e

# Default to local repo for development, can be overridden with environment variable
REPO_URL=${REPO_URL:-"https://github.com/yourusername/system-setup.git"}

echo "🔨 Building Docker image..."
echo "📍 Using repository: $REPO_URL"
docker build --build-arg REPO_URL="$REPO_URL" -t dev-setup .

echo "🚀 Running container..."
docker run -it --rm dev-setup

echo "✅ Container execution completed!"