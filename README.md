# Dotfiles

My personal dotfiles configuration for a productive development environment.

## 🔧 What's Included

### **🐚 Shell & Terminal**
- **Shell Configuration**: Fish, Zsh, Bash, and Nushell configurations
- **Terminal Emulators**: WezTerm, Alacritty, and Ghostty configurations
- **Prompt**: Starship prompt with Catppuccin theme
- **Package Managers**: Nix, Conda, Cargo, UV, and Homebrew setup

### **🎨 Desktop Environment (Hyprland/Wayland)**
- **Window Manager**: Hyprland configuration with animations and keybindings
- **Status Bar**: Waybar with custom modules and styling
- **Application Launcher**: Wofi with custom themes
- **Screen Locker**: Swaylock configuration
- **Logout Menu**: Wlogout styling

### **📝 Editors & Development**
- **Code Editor**: Zed editor settings (template with secure env vars)
- **Terminal Editor**: Micro editor with Catppuccin themes
- **Development Tools**: tmux, various aliases, and productivity tools

### **🎨 Theming**
- **Color Scheme**: Catppuccin Mocha theme across all applications
- **GTK**: GTK-3.0 theme settings
- **Consistent**: Unified look across terminal, editor, and desktop

## 🚀 Quick Setup

### **Automated Setup (Recommended)**

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Run the setup script:**
   ```bash
   ./setup.sh
   ```

The setup script will:
- Create `.env` file from template
- Set up Zed editor configuration
- Make scripts executable
- Optionally create symlinks to your home directory

### **Manual Setup**

1. **Set up environment variables:**
   ```bash
   cp .env.example .env
   # Edit .env with your actual API keys and credentials
   ```

2. **Configure Zed editor (if using):**
   ```bash
   cp .config/zed/settings.json.template .config/zed/settings.json
   # The template uses environment variables for security
   ```

3. **Make scripts executable:**
   ```bash
   find .config -name "*.sh" -exec chmod +x {} \;
   ```

## 🔐 Security Setup

This dotfiles repository uses environment variables to keep sensitive information secure.

### Required Environment Variables

Create a `.env` file in the root directory with the following variables:

```bash
# Firecrawl API Key (get from https://firecrawl.dev/)
FIRECRAWL_API_KEY=your_firecrawl_api_key_here

# Brave Search API Key (get from https://api.search.brave.com/)
BRAVE_API_KEY=your_brave_api_key_here

# GitHub Personal Access Token (GitHub Settings > Developer settings > Personal access tokens)
GITHUB_PERSONAL_ACCESS_TOKEN=your_github_token_here

# Database URL (format: postgresql://username:password@host:port/database)
DATABASE_URL=postgresql://username:password@localhost:5432/database_name
```

### Loading Environment Variables

To load these variables in your shell, add this to your shell configuration:

**For Fish shell:**
```fish
# Add to ~/.config/fish/config.fish
if test -f ~/.dotfiles/.env
    export (cat ~/.dotfiles/.env | grep -v '^#' | xargs)
end
```

**For Zsh/Bash:**
```bash
# Add to ~/.zshrc or ~/.bashrc
if [ -f ~/.dotfiles/.env ]; then
    export $(cat ~/.dotfiles/.env | grep -v '^#' | xargs)
fi
```

## 📁 File Structure

```
.
├── .config/
│   ├── alacritty/      # Alacritty terminal configuration
│   ├── fish/           # Fish shell configuration
│   ├── ghostty/        # Ghostty terminal configuration
│   ├── gtk-3.0/        # GTK theme settings
│   ├── hypr/           # Hyprland window manager config
│   │   ├── config/     # Modular Hyprland configurations
│   │   └── scripts/    # Hyprland utility scripts
│   ├── micro/          # Micro editor with Catppuccin themes
│   ├── nix/            # Nix configuration
│   ├── nushell/        # Nushell configuration
│   ├── swaylock/       # Screen locker configuration
│   ├── uv/             # UV Python package manager
│   ├── waybar/         # Status bar configuration
│   │   ├── modules/    # Custom waybar modules
│   │   └── style.css   # Waybar styling
│   ├── wlogout/        # Logout menu configuration
│   ├── wofi/           # Application launcher config
│   ├── zed/            # Zed editor settings (template)
│   ├── starship.toml   # Starship prompt configuration
│   ├── .wezterm.lua    # WezTerm terminal configuration
│   └── .zshrc          # Zsh configuration
├── .bashrc             # Bash configuration
├── .gitignore          # Git ignore patterns (includes security patterns)
├── .env.example        # Environment variables template
└── README.md           # This file
```

## 🛠 Tools & Dependencies

### **🐚 Shells & Prompts**
- **Fish Shell**: Modern shell with great defaults and autocompletion
- **Zsh**: Extended Bourne shell with powerful features
- **Bash**: Classic Unix shell
- **Nushell**: Modern shell with structured data
- **Starship**: Fast, cross-shell prompt with Git integration

### **🖥️ Terminal Emulators**
- **WezTerm**: GPU-accelerated terminal with Lua configuration
- **Alacritty**: Fast, cross-platform terminal emulator
- **Ghostty**: High-performance terminal emulator

### **🎨 Desktop Environment (Wayland/Hyprland)**
- **Hyprland**: Dynamic tiling Wayland compositor
- **Waybar**: Highly customizable status bar
- **Wofi**: Application launcher for Wayland
- **Swaylock**: Screen locker for Wayland
- **Wlogout**: Logout menu for Wayland

### **📝 Editors & Development**
- **Zed**: High-performance, collaborative code editor
- **Micro**: Modern terminal-based text editor
- **tmux**: Terminal multiplexer for session management

### **📦 Package Managers**
- **Nix**: Declarative package manager
- **UV**: Fast Python package installer and resolver
- **Homebrew**: Package manager for macOS/Linux
- **Conda**: Python environment and package manager

### **🔧 Utilities**
- **eza**: Modern replacement for ls with icons and Git integration
- **Git**: Version control with custom configuration

## 🎨 Theme

Uses the **Catppuccin Mocha** color scheme across all applications for a consistent look.

## ⚠️ Security Notes

- Never commit `.env` files or files containing secrets
- Use the provided `.env.example` as a template
- The `.gitignore` includes patterns to prevent accidental commits of sensitive files
- Zed settings use environment variable substitution for API keys

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
