#!/usr/bin/env bash
# Helper script for markitdown-mcp installation and MCP registration.
# This is a reference implementation — the SKILL.md instructions drive the actual setup.

set -e

SETTINGS_FILE="$HOME/.claude/settings.json"

# Install markitdown-mcp if not already installed
if ! command -v markitdown-mcp &>/dev/null; then
  echo "Installing markitdown-mcp..."
  pip install markitdown-mcp
else
  echo "markitdown-mcp already installed at: $(which markitdown-mcp)"
fi

MCP_PATH=$(which markitdown-mcp)

# Ensure settings.json exists
if [ ! -f "$SETTINGS_FILE" ]; then
  echo "{}" > "$SETTINGS_FILE"
fi

# Check if already registered
if grep -q '"markitdown"' "$SETTINGS_FILE" 2>/dev/null; then
  echo "markitdown MCP server is already registered in $SETTINGS_FILE"
  exit 0
fi

# Use Python to merge the new server entry safely
python3 - <<EOF
import json, sys

with open("$SETTINGS_FILE", "r") as f:
    settings = json.load(f)

settings.setdefault("mcpServers", {})["markitdown"] = {
    "command": "$MCP_PATH",
    "args": []
}

with open("$SETTINGS_FILE", "w") as f:
    json.dump(settings, f, indent=2)

print("✅ markitdown MCP server registered. Please restart Claude Code to activate it.")
EOF
