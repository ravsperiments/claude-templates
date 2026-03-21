# Organize Documentation

Keep docs organized, never scattered.

## Default Structure

```
project/
├── README.md              # Project overview only
├── docs/                  # All other documentation
│   ├── getting-started.md
│   ├── architecture.md
│   ├── api.md
│   └── ...
└── CLAUDE.md              # Claude instructions (root)
```

## Rules

NEVER create markdown files in:
- Root directory (except README.md, CLAUDE.md, CHANGELOG.md)
- Random subdirectories
- Next to source files (unless inline code docs)

ALWAYS put documentation in `docs/` folder.

## Instructions

If $ARGUMENTS is empty:
1. Find scattered .md files: `find . -name "*.md" -not -path "./docs/*" -not -path "./node_modules/*" -not -path "./.git/*"`
2. List files that should move to `docs/`
3. Exclude: README.md, CLAUDE.md, CHANGELOG.md, LICENSE.md
4. Ask user to confirm before moving
5. Move files, update any internal links

If $ARGUMENTS is "sync" or "update":
1. Review git history for recent changes:
   ```bash
   git log --oneline -20
   git diff --stat HEAD~10
   ```
2. Check if README.md reflects current state:
   - Project description accurate?
   - Install/usage instructions current?
   - Features list up to date?
3. Check if CHANGELOG.md needs updating (if exists)
4. Scan docs/ for outdated content
5. Propose updates, ask for confirmation before editing

If $ARGUMENTS is "readme":
1. Analyze codebase: package.json, main files, structure
2. Review recent git history for context
3. Generate/update README.md using template below
4. Keep it concise — link to docs/ for details

## README Template

```markdown
# Project Name

One-line description of what this does.

## Quick Start

\`\`\`bash
# Install
<install command>

# Run
<run command>
\`\`\`

## What It Does

2-3 sentences explaining the core functionality.
No marketing speak. Just what it does.

## Usage

\`\`\`bash
# Basic example
<command or code>
\`\`\`

## Configuration

| Option | Default | Description |
|--------|---------|-------------|
| `option` | `value` | What it does |

(Only if config exists. Skip if not needed.)

## Project Structure

\`\`\`
src/
├── main.ts      # Entry point
└── lib/         # Core logic
\`\`\`

(Only for non-obvious structures. Skip for simple projects.)

## License

MIT (or whatever applies)
```

### README Rules

- No badges unless meaningful
- No "Features" list with checkmarks
- No screenshots unless essential
- No "Contributing" section for solo projects
- Quick Start must actually work — test it
- Link to docs/ for anything longer than 3 lines

If $ARGUMENTS is other text:
1. Create the requested doc in `docs/` folder
2. Use clear heading structure
3. Keep it concise

## Examples

```
/docs                     # Find and organize scattered docs
/docs sync                # Update docs based on git history
/docs update              # Same as sync
/docs readme              # Update README.md from codebase
/docs api reference       # Create docs/api-reference.md
/docs architecture        # Create docs/architecture.md
```

$ARGUMENTS
