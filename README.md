# markitdown-skill

Claude Code skills for [markitdown](https://github.com/microsoft/markitdown) — convert any file or URL to Markdown using Microsoft's markitdown MCP server.

## Skills

| Skill | Description |
|-------|-------------|
| `/markitdown-setup` | Installs `markitdown-mcp` and registers it as an MCP server in Claude Code |
| `/convert <path or URL>` | Converts a file or URL to Markdown |

## Installation

```bash
npx skills add heyman333/markitdown-skill
```

## Usage

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
- Claude Code with MCP support

## License

MIT
