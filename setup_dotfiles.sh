#!/bin/bash
# 🔄 Dotfiles Management for Multi-Mac Sync

DOTFILES_DIR="$HOME/Development/Dotfiles"
BACKUP_DIR="$DOTFILES_DIR/backup-$(date +%Y%m%d)"

echo "🔄 Setting up dotfiles management..."

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Backup existing dotfiles
echo "📦 Backing up existing dotfiles..."
cp ~/.zshrc "$BACKUP_DIR/zshrc.backup" 2>/dev/null || echo "No existing .zshrc"
cp ~/.gitconfig "$BACKUP_DIR/gitconfig.backup" 2>/dev/null || echo "No existing .gitconfig"

# Copy current dotfiles to dotfiles directory
echo "📋 Copying current configs to dotfiles repo..."
cp ~/.zshrc "$DOTFILES_DIR/zshrc"
cp ~/.gitconfig "$DOTFILES_DIR/gitconfig" 2>/dev/null || echo "No .gitconfig found"

# Create symlinks
echo "🔗 Creating symlinks..."
ln -sf "$DOTFILES_DIR/zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/gitconfig" ~/.gitconfig 2>/dev/null || echo "Will create gitconfig later"

# Create a global git ignore
cat > "$DOTFILES_DIR/gitignore_global" << 'EOF'
# macOS
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Editor files
.vscode/
.cursor/
*.swp
*.swo
*~

# Node
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Python
__pycache__/
*.py[cod]
*$py.class
.env
.venv/

# Claude/AI
.claude/
.cursorrules*
CLAUDE.md
EOF

ln -sf "$DOTFILES_DIR/gitignore_global" ~/.gitignore_global

# Create Claude Code global config
mkdir -p "$DOTFILES_DIR/claude-config"
cat > "$DOTFILES_DIR/claude-config/CLAUDE.md" << 'EOF'
# Global Claude Code Configuration

## Project Structure Rules
- Always use the ~/Development/ structure
- 01-Active-Projects: Current work
- 02-Learning-Experiments: Tutorials, learning
- 03-Tools-And-Scripts: Utilities
- 99-Sandbox: Quick tests

## Git Workflow
- One project = one git repo
- Never nest git repos
- Always use descriptive commit messages
- Push frequently to avoid conflicts

## File Organization
- Keep configs in ~/Development/Claude-Tools/
- Use templates for new projects
- Clean up sandbox regularly

## Development Environment
- Use proper virtual environments
- Keep global tools in ~/Development/03-Tools-And-Scripts/
- Document everything in README files
EOF

echo "✅ Dotfiles setup complete!"
echo ""
echo "📋 Next steps:"
echo "1. cd ~/Development/Dotfiles"
echo "2. git init"
echo "3. git add ."
echo "4. git commit -m 'Initial dotfiles setup'"
echo "5. Create GitHub repo and push"
echo "6. Clone this repo on your other Mac"
echo "7. Run this script on the other Mac"
echo ""
echo "🔄 To sync changes between Macs:"
echo "   git add . && git commit -m 'Update configs' && git push"
echo "   (on other Mac) git pull"