#!/bin/bash

set -e

echo "🔨 Building Docker image..."
docker build -t dev-setup .

echo "🚀 Running container..."
docker run -it --rm dev-setup

echo "✅ Container execution completed!"