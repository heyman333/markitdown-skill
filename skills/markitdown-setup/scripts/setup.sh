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

# Register in Claude Code
if command -v claude &>/dev/null; then
  if claude mcp list 2>/dev/null | grep -q "markitdown"; then
    echo "markitdown MCP server is already registered in Claude Code."
  else
    claude mcp add -s user markitdown "$MCP_PATH"
    echo "✅ markitdown MCP server registered in Claude Code. Please restart Claude Code to activate it."
  fi
fi

# Register in Codex CLI
if command -v codex &>/dev/null; then
  CODEX_CONFIG_DIR="$HOME/.codex"
  CODEX_CONFIG="$CODEX_CONFIG_DIR/config.yaml"
  mkdir -p "$CODEX_CONFIG_DIR"

  if [ -f "$CODEX_CONFIG" ] && grep -q "markitdown" "$CODEX_CONFIG"; then
    echo "markitdown MCP server is already registered in Codex CLI."
  else
    python3 - "$CODEX_CONFIG" "$MCP_PATH" <<'EOF'
import sys, os

config_path = sys.argv[1]
mcp_path = sys.argv[2]

# Read existing config
content = ""
if os.path.exists(config_path):
    with open(config_path) as f:
        content = f.read()

# Append mcpServers block if not present
if "mcpServers:" not in content:
    content = content.rstrip() + ("\n" if content else "") + "mcpServers:\n"

if "markitdown:" not in content:
    content += f"  markitdown:\n    command: {mcp_path}\n"

with open(config_path, "w") as f:
    f.write(content)

print("Written to", config_path)
EOF
    echo "✅ markitdown MCP server registered in Codex CLI. Please restart Codex to activate it."
  fi
fi

if ! command -v claude &>/dev/null && ! command -v codex &>/dev/null; then
  echo "⚠️  Neither Claude Code nor Codex CLI found. Please install one of them first."
  exit 1
fi
