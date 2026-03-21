# Claude Code Configuration

Minimal, portable Claude Code setup for solo developers.

## Philosophy

- One dial complexity
- No enterprise patterns
- Understand what you build
- Forkable by strangers

Based on research from [Anthropic's best practices](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices), [Boris Cherny's tips](https://howborisusesclaudecode.com), [Simon Willison's cognitive debt concept](https://simonwillison.net/tags/cognitive-debt/), and [nanochat's simplicity philosophy](https://github.com/karpathy/nanochat).

## Install

```bash
git clone https://github.com/ravsperiments/claude-templates.git
cd claude-templates
./install.sh
```

## Usage

```bash
./install.sh              # Install global config to ~/.claude/
./install.sh global       # Same as above
./install.sh list         # List available project templates
./install.sh <template>   # Init project with template CLAUDE.md
```

**Auto-update via cron:**
```bash
# Add to crontab -e (runs every 30 min)
*/30 * * * * ~/path/to/claude-templates/update.sh
```

Or manually: `git pull && ./install.sh`

### Examples

```bash
# Setup new machine
./install.sh

# Start new ML project
cd ~/projects/my-ml-project
~/claude-templates/install.sh ml
```

## Structure

```
claude-templates/
├── install.sh
├── update.sh                # Auto-update script
├── README.md
├── global/                  # Global ~/.claude config
│   ├── CLAUDE.md
│   ├── settings.json
│   └── commands/
│       ├── branch.md
│       ├── commit.md
│       ├── dev.md
│       ├── docs.md
│       ├── init.md
│       ├── pr.md
│       └── verify.md
└── templates/               # Project-specific templates
    ├── ml/
    │   └── CLAUDE.md
    ├── typescript/
    │   └── CLAUDE.md
    └── python/
        └── CLAUDE.md
```

## Commands

| Command | Purpose |
|---------|---------|
| `/init` | Create/review project CLAUDE.md |
| `/branch` | Create branch with good name |
| `/verify` | Lint, build, test (add `review` for deep analysis) |
| `/commit` | Staged → commit |
| `/pr` | Push + create PR |
| `/docs` | Organize documentation (add `review` for cleanup) |
| `/dev` | Manage .dev/ workspace |

## Workflow

```
/init                    →  Create project CLAUDE.md
    ↓
/branch add user auth    →  feat/user-auth
    ↓
    ... work ...
    ↓
/verify                  →  lint, build, test
    ↓
/commit                  →  staged → commit
    ↓
/pr                      →  push + PR
```

## Token Budget

- Global CLAUDE.md: ~400 tokens
- Project CLAUDE.md: ~300 tokens

Total under 1000 tokens per session.

## Plugins

Minimal set:
- `github` — gh CLI integration
- `typescript-lsp` — TypeScript support

## Creating Templates

Add new template:
```bash
mkdir templates/my-template
# Create templates/my-template/CLAUDE.md
```

Then use:
```bash
./install.sh my-template
```
