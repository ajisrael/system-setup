# Use the latest Ubuntu image as base
FROM ubuntu:latest

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install essential development tools
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user for development and give sudo privileges
RUN useradd -m -s /bin/bash devuser && \
    echo 'devuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Switch to the development user and set home directory as working directory
USER devuser
WORKDIR /home/devuser

# Copy setup scripts and system scripts from host to container and make them executable
COPY --chown=devuser:devuser setup-scripts/ ./setup-scripts/
COPY --chown=devuser:devuser system-scripts/ ./system-scripts/
RUN chmod +x ./setup-scripts/*.sh ./system-scripts/*.sh

# Run the main setup script when container starts
CMD ["./setup-scripts/setup.sh"]

