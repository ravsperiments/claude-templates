#!/bin/bash
# Auto-update claude-templates and reinstall if changed

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

# Fetch latest
git fetch --quiet origin main

# Check if behind
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/main)

if [ "$LOCAL" != "$REMOTE" ]; then
    git pull --quiet origin main
    ./install.sh
    echo "$(date): Updated claude-templates" >> ~/.claude/update.log
fi
