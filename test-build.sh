#!/bin/bash

# Test script to validate image builds locally
set -e

echo "🔍 Discovering images in the images/ directory..."

# Find all directories in images/ that contain a Dockerfile
IMAGE_DIRS=$(find images -mindepth 1 -maxdepth 1 -type d -exec test -f {}/Dockerfile \; -print | sed 's|images/||')

if [ -z "$IMAGE_DIRS" ]; then
    echo "❌ No images found with Dockerfile"
    exit 1
fi

echo "📦 Found images: $IMAGE_DIRS"

# Build each image
for image in $IMAGE_DIRS; do
    echo "🏗️  Building image: $image"
    docker build -t "l0rd/$image:test" "./images/$image/"
    
    echo "✅ Successfully built l0rd/$image:test"
    
    # Basic test - check if image exists
    if docker images "l0rd/$image:test" | grep -q "l0rd/$image"; then
        echo "✅ Image l0rd/$image:test exists in local registry"
    else
        echo "❌ Image l0rd/$image:test not found"
        exit 1
    fi
done

echo "🎉 All images built successfully!"
echo ""
echo "🐳 Available test images:"
docker images | grep "l0rd.*test"