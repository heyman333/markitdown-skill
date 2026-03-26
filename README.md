# markitdown-skill

Skills for [markitdown](https://github.com/microsoft/markitdown) — convert any file or URL to Markdown using Microsoft's markitdown MCP server.

Supports **Claude Code** and **OpenAI Codex CLI**.

## Skills

| Skill | Description |
|-------|-------------|
| `/markitdown-setup` | Installs `markitdown-mcp` and registers it as an MCP server |
| `/convert <path or URL>` | Converts a file or URL to Markdown |

## Installation

### Claude Code

```bash
npx skills add heyman333/markitdown-skill
```

Then run `/markitdown-setup` and restart Claude Code.

### Codex CLI

Codex CLI does not have a skill system, so install manually:

```bash
pip install markitdown-mcp
```

Then add to `~/.codex/config.yaml`:

```yaml
mcpServers:
  markitdown:
    command: /path/to/markitdown-mcp
```

> Replace `/path/to/markitdown-mcp` with the output of `which markitdown-mcp`.

Restart Codex CLI. After that, just ask naturally:

```
Convert https://example.com to Markdown
Read this file as Markdown: ~/Downloads/report.pdf
```

## Usage (Claude Code)

**Step 1** — Set up the MCP server (run once):
```
/markitdown-setup
```
Then restart Claude Code.

**Step 2** — Convert files or URLs:
```
/convert /path/to/document.pdf
/convert https://example.com
/convert ~/Downloads/presentation.pptx
```

## Supported Formats

markitdown supports: PDF, Word (.docx), PowerPoint (.pptx), Excel (.xlsx), images (OCR), audio (transcription), HTML, YouTube URLs, CSV, JSON, XML, ZIP, EPub, and more.

## Requirements

- Python 3.10+
- Claude Code with MCP support, or OpenAI Codex CLI with MCP support

## License

MIT
