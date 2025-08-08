# Docker Usage with Git Repository

## Overview
The Dockerfile now clones the setup repository instead of copying local files, making it more realistic to actual deployment scenarios.

## Usage

### Using Your Own Repository
```bash
# Set your repository URL
export REPO_URL="https://github.com/yourusername/your-system-setup.git"

# Build and test
./build-and-run.sh
```

### Using Different Repositories
```bash
# Test with a different repo
REPO_URL="https://github.com/otherusername/system-setup.git" ./build-and-run.sh

# Quick test with different repo
REPO_URL="https://github.com/otherusername/system-setup.git" ./test-setup.sh
```

### Manual Docker Commands
```bash
# Build with custom repo
docker build --build-arg REPO_URL="https://github.com/yourusername/system-setup.git" -t dev-setup .

# Run container
docker run -it --rm dev-setup

# Run with bash access
docker run -it --rm dev-setup bash
```

## Development Workflow

1. **Local Development**: Make changes to your setup scripts locally
2. **Commit & Push**: Push changes to your GitHub repository
3. **Test**: Run `./build-and-run.sh` to test the changes in Docker
4. **Deploy**: Use the same repository URL on actual systems

## Benefits

- **Realistic Testing**: Mirrors how you'd actually deploy on real systems
- **Version Control**: Always tests the committed version
- **Portability**: Same approach works on any system with git and Docker
- **No File Copying**: No need to worry about Docker context size