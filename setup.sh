#!/bin/bash

# Dotfiles Setup Script
# This script helps you set up the dotfiles configuration

set -e

echo "🚀 Dotfiles Setup Script"
echo "========================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if we're in the dotfiles directory
if [[ ! -f "README.md" ]] || [[ ! -d ".config" ]]; then
    print_error "Please run this script from the dotfiles directory"
    exit 1
fi

print_status "Setting up dotfiles configuration..."

# 1. Create environment file from template
if [[ ! -f ".env" ]]; then
    print_status "Creating .env file from template..."
    cp .env.example .env
    print_warning "Please edit .env file with your actual API keys and credentials"
    print_warning "The following environment variables need to be configured:"
    echo "  - FIRECRAWL_API_KEY"
    echo "  - BRAVE_API_KEY" 
    echo "  - GITHUB_PERSONAL_ACCESS_TOKEN"
    echo "  - DATABASE_URL"
else
    print_warning ".env file already exists, skipping..."
fi

# 2. Set up Zed configuration if it doesn't exist
if [[ ! -f ".config/zed/settings.json" ]]; then
    print_status "Setting up Zed editor configuration..."
    cp .config/zed/settings.json.template .config/zed/settings.json
    print_success "Zed configuration created from template"
else
    print_warning "Zed settings.json already exists, skipping..."
fi

# 3. Make scripts executable
print_status "Making scripts executable..."
find .config -name "*.sh" -exec chmod +x {} \;
find .config -name "screenshot*" -exec chmod +x {} \;
chmod +x .config/waybar/mediaplayer.py
chmod +x .config/waybar/modules/*.py
chmod +x .config/waybar/modules/*.sh
print_success "Scripts made executable"

# 4. Create symlinks (optional)
echo ""
read -p "Do you want to create symlinks to your home directory? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    print_status "Creating symlinks..."
    
    # Backup existing configs
    BACKUP_DIR="$HOME/.config_backup_$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$BACKUP_DIR"
    
    # List of configs to symlink
    configs=("fish" "alacritty" "hypr" "waybar" "wofi" "swaylock" "wlogout" "micro" "nushell" "zed" "gtk-3.0")
    
    for config in "${configs[@]}"; do
        if [[ -d "$HOME/.config/$config" ]]; then
            print_warning "Backing up existing $config configuration..."
            mv "$HOME/.config/$config" "$BACKUP_DIR/"
        fi
        
        print_status "Linking $config configuration..."
        ln -sf "$(pwd)/.config/$config" "$HOME/.config/"
    done
    
    # Link individual files
    if [[ -f "$HOME/.config/starship.toml" ]]; then
        mv "$HOME/.config/starship.toml" "$BACKUP_DIR/"
    fi
    ln -sf "$(pwd)/.config/starship.toml" "$HOME/.config/"
    
    if [[ -f "$HOME/.config/.wezterm.lua" ]]; then
        mv "$HOME/.config/.wezterm.lua" "$BACKUP_DIR/"
    fi
    ln -sf "$(pwd)/.config/.wezterm.lua" "$HOME/.config/"
    
    print_success "Symlinks created successfully"
    print_status "Backup of original configs saved to: $BACKUP_DIR"
else
    print_status "Skipping symlink creation"
fi

echo ""
print_success "Setup complete! 🎉"
echo ""
print_status "Next steps:"
echo "1. Edit .env file with your actual credentials"
echo "2. Restart your terminal or source your shell configuration"
echo "3. If using Hyprland, restart your session to apply changes"
echo ""
print_status "For more information, see README.md"
