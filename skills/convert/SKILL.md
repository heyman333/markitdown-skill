---
name: convert
description: Converts a file path or URL to Markdown using markitdown. Usage: /convert <file-path or URL>
argument-hint: "<file-path or URL>"
user-invocable: true
---

Convert `$ARGUMENTS` to Markdown using the markitdown MCP server.

Follow these rules to build the URI:
- If the argument starts with `http://` or `https://` or `data:`, use it as-is.
- If the argument is a local file path (absolute or relative), convert it to a `file://` URI.
  - Resolve relative paths to absolute using the current working directory.
  - Example: `/Users/me/docs/report.pdf` → `file:///Users/me/docs/report.pdf`

Then call the `convert_to_markdown(uri)` tool from the markitdown MCP server with the constructed URI.

Output the resulting Markdown content directly.

If the `convert_to_markdown` tool is not available, print:
"⚠️ markitdown MCP server is not connected. Please run /markitdown-setup first, then restart Claude Code."
