#!/bin/bash

# Set up directories and environment paths as needed
RESOURCE_DIR="/opt/resources"
TARGET_DIR="/home/taller"

# Install pyenv if not present
if [ ! -d "$TARGET_DIR/.pyenv" ]; then
    echo "Installing pyenv..."
    curl https://pyenv.run | bash

    # Add pyenv to PATH and initialize it
    export PATH="$TARGET_DIR/.pyenv/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"

    # Install 3.12.7
    echo "Installing Python 3.12.7 with pyenv..."
    pyenv install 3.12.7
fi

# Copy .zshrc if it doesn't exist
if [ ! -f "$TARGET_DIR/.zshrc" ]; then
    echo "Copying .zshrc configuration..."
    cp "$RESOURCE_DIR/.zshrc" "$TARGET_DIR/.zshrc"
    sed -i 's/\r$//' $TARGET_DIR/.zshrc
fi

# Copy starship configuration if it doesn't exist
if [ ! -f "$TARGET_DIR/.config/starship.toml" ]; then
    echo "Copying starship configuration..."
    mkdir -p "$TARGET_DIR/.config"
    cp "$RESOURCE_DIR/starship.toml" "$TARGET_DIR/.config/starship.toml"
    sed -i 's/\r$//' $TARGET_DIR/.config/starship.toml
fi

# Execute the container's main process
exec "$@"

