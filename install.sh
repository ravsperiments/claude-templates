#!/bin/bash
# Install Claude Code configuration
#
# Usage:
#   ./install.sh              Install global config to ~/.claude/
#   ./install.sh global       Same as above
#   ./install.sh <template>   Copy template CLAUDE.md to current directory
#   ./install.sh list         List available templates

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GLOBAL_DIR="$SCRIPT_DIR/global"
TEMPLATES_DIR="$SCRIPT_DIR/templates"
TARGET_DIR="$HOME/.claude"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

usage() {
    echo "Usage: ./install.sh [command]"
    echo ""
    echo "Commands:"
    echo "  (none), global    Install global config to ~/.claude/"
    echo "  <template>        Copy template CLAUDE.md to current directory"
    echo "  list              List available templates"
    echo ""
    echo "Examples:"
    echo "  ./install.sh              # Install global config"
    echo "  ./install.sh ml           # Init ML project template"
    echo "  ./install.sh list         # Show available templates"
}

list_templates() {
    echo "Available templates:"
    echo ""
    if [ -d "$TEMPLATES_DIR" ] && [ "$(ls -A "$TEMPLATES_DIR" 2>/dev/null)" ]; then
        for dir in "$TEMPLATES_DIR"/*/; do
            if [ -d "$dir" ]; then
                name=$(basename "$dir")
                desc=""
                if [ -f "$dir/CLAUDE.md" ]; then
                    # Extract first line after "# " as description
                    desc=$(head -5 "$dir/CLAUDE.md" | grep -v "^#" | grep -v "^$" | head -1)
                fi
                printf "  ${GREEN}%-15s${NC} %s\n" "$name" "$desc"
            fi
        done
    else
        echo "  (no templates yet)"
    fi
    echo ""
    echo "Create templates in: $TEMPLATES_DIR/<name>/CLAUDE.md"
}

install_global() {
    echo "Installing global Claude Code configuration..."

    # Create target directories
    mkdir -p "$TARGET_DIR/commands"

    # Backup and link function
    install_file() {
        local src="$1"
        local dst="$2"

        if [ -L "$dst" ]; then
            rm "$dst"
        elif [ -f "$dst" ]; then
            echo "  Backing up $(basename "$dst")"
            cp "$dst" "$dst.backup"
        fi

        ln -sf "$src" "$dst"
        echo "  Linked $(basename "$dst")"
    }

    echo ""
    echo "Configuration files:"
    install_file "$GLOBAL_DIR/CLAUDE.md" "$TARGET_DIR/CLAUDE.md"
    install_file "$GLOBAL_DIR/settings.json" "$TARGET_DIR/settings.json"

    echo ""
    echo "Commands:"
    for cmd in "$GLOBAL_DIR/commands"/*.md; do
        if [ -f "$cmd" ]; then
            name=$(basename "$cmd")
            install_file "$cmd" "$TARGET_DIR/commands/$name"
        fi
    done

    echo ""
    echo -e "${GREEN}Done!${NC} Global config installed to ~/.claude/"
    echo ""
    echo "Commands available:"
    echo "  /branch  - Create branch with good name"
    echo "  /verify  - Lint, build, test"
    echo "  /commit  - Staged → commit"
    echo "  /pr      - Push + create PR"
}

install_template() {
    local template="$1"
    local template_dir="$TEMPLATES_DIR/$template"

    if [ ! -d "$template_dir" ]; then
        echo "Error: Template '$template' not found."
        echo ""
        list_templates
        exit 1
    fi

    if [ ! -f "$template_dir/CLAUDE.md" ]; then
        echo "Error: Template '$template' has no CLAUDE.md"
        exit 1
    fi

    # Check if CLAUDE.md already exists in current directory
    if [ -f "CLAUDE.md" ]; then
        echo -e "${YELLOW}Warning:${NC} CLAUDE.md already exists in current directory."
        read -p "Overwrite? [y/N] " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo "Aborted."
            exit 1
        fi
        cp "CLAUDE.md" "CLAUDE.md.backup"
        echo "  Backed up existing CLAUDE.md"
    fi

    cp "$template_dir/CLAUDE.md" "./CLAUDE.md"
    echo -e "${GREEN}Done!${NC} Created CLAUDE.md from '$template' template"

    # Copy any additional template files (not CLAUDE.md)
    for file in "$template_dir"/*; do
        if [ -f "$file" ] && [ "$(basename "$file")" != "CLAUDE.md" ]; then
            cp "$file" "./"
            echo "  Copied $(basename "$file")"
        fi
    done
}

# Main
case "${1:-global}" in
    -h|--help|help)
        usage
        ;;
    list)
        list_templates
        ;;
    global)
        install_global
        ;;
    *)
        if [ -d "$TEMPLATES_DIR/$1" ]; then
            install_template "$1"
        else
            install_global
        fi
        ;;
esac
