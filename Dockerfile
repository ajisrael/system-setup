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

# Set the repository URL (replace with your actual repo URL)
ARG REPO_URL=https://github.com/yourusername/system-setup.git

# Clone the repository and make scripts executable
RUN git clone ${REPO_URL} system-setup && \
    chmod +x system-setup/setup-scripts/*.sh system-setup/system-scripts/*.sh

# Run the main setup script when container starts
CMD ["./system-setup/setup-scripts/setup.sh"]

