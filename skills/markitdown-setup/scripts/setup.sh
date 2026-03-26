#!/usr/bin/env bash
# Helper script for markitdown-mcp installation and MCP registration.

set -e

# Install markitdown-mcp if not already installed
if ! command -v markitdown-mcp &>/dev/null; then
  echo "Installing markitdown-mcp..."
  pip install markitdown-mcp
else
  echo "markitdown-mcp already installed at: $(which markitdown-mcp)"
fi

MCP_PATH=$(which markitdown-mcp)

# Check if already registered
if claude mcp list 2>/dev/null | grep -q "markitdown"; then
  echo "markitdown MCP server is already registered."
  exit 0
fi

# Register using claude mcp add with user scope (works from any directory)
claude mcp add -s user markitdown "$MCP_PATH"

echo "✅ markitdown MCP server registered. Please restart Claude Code to activate it."
