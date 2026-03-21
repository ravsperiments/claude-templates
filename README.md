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
├── README.md
├── global/                  # Global ~/.claude config
│   ├── CLAUDE.md
│   ├── settings.json
│   └── commands/
│       ├── branch.md
│       ├── verify.md
│       ├── commit.md
│       └── pr.md
└── templates/               # Project-specific templates
    ├── ml/
    │   └── CLAUDE.md
    ├── typescript/
    │   └── CLAUDE.md
    └── python/
        └── CLAUDE.md
```

## Workflow

```
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
