# System Setup

A Docker-based development environment setup inspired by ThePrimeagen's dotfiles. This project allows you to test and iterate on your development environment setup scripts in a containerized Ubuntu environment.

## Quick Start

### Build and Test
```bash
# Build the Docker image and run a quick test
./test-setup.sh

# Build and run the full setup interactively
./build-and-run.sh
```

### Manual Docker Commands
```bash
# Build the image
docker build -t dev-setup .

# Run the container interactively
docker run -it --rm dev-setup bash

# Run the full setup
docker run --rm dev-setup
```

## Project Structure

```
.
├── Dockerfile              # Minimal Ubuntu-based container (git, curl, wget, build tools)
├── scripts/
│   ├── setup.sh            # Main orchestration script with timezone setup
│   ├── install-basics.sh   # Basic development tools (jq, ripgrep, fzf)
│   ├── install-languages.sh # Programming languages (Node.js via NVM, Python)
│   ├── install-dev-tools.sh # Development tools (neovim, tmux)
│   └── setup-shell.sh      # Shell customizations (Oh My Zsh, NVM integration)
├── build-and-run.sh        # Quick build and run script
├── test-setup.sh           # Test the Docker setup
└── README.md               # This file
```

## What Gets Installed

### Docker Base Image
- Ubuntu latest with essential tools (git, curl, wget, build-essential, sudo)
- Non-root user (devuser) with sudo privileges
- Non-interactive installation environment

### Basic Tools
- jq (JSON processor)
- ripgrep (fast grep alternative)
- fzf (fuzzy finder)

### Programming Languages
- Node.js (LTS via NVM)
- Python 3 with pip and venv

### Development Tools
- Neovim
- Tmux

### Shell Customizations
- Oh My Zsh (non-interactive installation)
- NVM integration for bash and zsh
- America/Detroit timezone configuration

## Key Features

- **Completely Non-Interactive**: All installations run without prompting for user input
- **Minimal Docker Base**: Only essential tools in the Docker image, everything else in scripts
- **NVM for Node.js**: Version management instead of direct Node.js installation
- **Timezone Configured**: Automatically sets America/Detroit timezone
- **Modular Scripts**: Easy to customize and extend

## Customizing

Modify the scripts in the `scripts/` directory to add or remove tools according to your needs. The setup is modular, so you can easily:

- Add new installation scripts
- Modify existing tools
- Change shell configurations
- Update language versions
- Change timezone in `scripts/setup.sh`

## Testing Changes

After making changes to any script:

1. Run `./test-setup.sh` for a quick validation
2. Run `./build-and-run.sh` to test the full installation
3. Use `docker run -it --rm dev-setup bash` to explore the environment interactively