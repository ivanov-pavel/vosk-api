#!/bin/bash
set -e

echo "Building Windows Docker image with cache..."

# Enable BuildKit and caching
export DOCKER_BUILDKIT=1
export BUILDKIT_INLINE_CACHE=1

# Build with cache
docker build \
    --file travis/Dockerfile.win \
    --tag alphacep/kaldi-win:latest \
    --build-arg BUILDKIT_INLINE_CACHE=1 \
    --cache-from type=gha \
    --cache-to type=gha,mode=max \
    .

echo "Docker image built successfully!"
