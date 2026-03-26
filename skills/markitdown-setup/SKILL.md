---
name: markitdown-setup
description: Installs markitdown-mcp and registers it as an MCP server in Claude Code settings. Run once before using /convert.
argument-hint: ""
allowed-tools: Bash, Read, Edit
---

Set up the markitdown MCP server by following these steps in order:

1. Run `pip install markitdown-mcp` to install the package. If it's already installed, skip this step.

2. Run `which markitdown-mcp` to get the full path of the installed binary.

3. Read `~/.claude/settings.json`.

4. If `mcpServers.markitdown` is not already present, add it to the JSON:
   ```json
   "mcpServers": {
     "markitdown": {
       "command": "<path from step 2>",
       "args": []
     }
   }
   ```
   Preserve all existing settings and merge carefully.

5. Write the updated JSON back to `~/.claude/settings.json`.

6. Print a success message: "✅ markitdown MCP server registered. Please restart Claude Code to activate it."

If anything fails, explain clearly what went wrong and how to fix it.
