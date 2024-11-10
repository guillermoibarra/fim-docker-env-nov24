#!/bin/bash

# Create data directory if it doesn't exist
if [ ! -d "./data" ]; then
    mkdir ./data
    echo "Created 'data' directory for persistent storage."
fi

# Check if Docker image exists, build if it doesn't
if ! docker image inspect fim-taller-env >/dev/null 2>&1; then
    echo "Docker image not found. Building the image..."
    docker build -t fim-taller-env .
    if [ $? -ne 0 ]; then
        echo "Docker build failed."
        exit 1
    fi
else
    echo "Docker image already exists. Skipping build."
fi

# Run the Docker container with persistent volume
docker run -it --rm -p 8888-8899:8888-8899 -v "$(pwd)/data:/home/taller" fim-taller-env
