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

If $ARGUMENTS provided:
1. Create the requested doc in `docs/` folder
2. Use clear heading structure
3. Keep it concise

## Examples

```
/docs                     # Find and organize scattered docs
/docs api reference       # Create docs/api-reference.md
/docs architecture        # Create docs/architecture.md
```

$ARGUMENTS
