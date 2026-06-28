#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
POLICY="$ROOT/AGENT_POLICY.md"
CLAUDE_OUT="$ROOT/CLAUDE.md"
CODEX_OUT="$ROOT/AGENTS.md"

if [[ ! -f "$POLICY" ]]; then
  echo "Missing $POLICY" >&2
  exit 1
fi

cat "$POLICY" > "$CLAUDE_OUT"

{
  cat "$POLICY"
  cat <<'CODEX_EXTRA'

## Codex Skill Loading

Use only the lean shared coding-agent skills, and only when directly relevant:

- `superpowers:verification-before-completion`
- `superpowers:systematic-debugging`
- `superpowers:code-review`

Load a skill with:

```bash
~/.codex/superpowers/.codex/superpowers-codex use-skill <skill-name>
```

Do not load archived skills unless explicitly asked.
CODEX_EXTRA
} > "$CODEX_OUT"

link_file() {
  local target="$1"
  local link="$2"
  if [[ -L "$link" || ! -e "$link" ]]; then
    ln -sfn "$target" "$link"
  else
    echo "Refusing to replace non-symlink $link" >&2
    exit 1
  fi
}

mkdir -p "$HOME/.claude" "$HOME/.codex"
link_file "$CLAUDE_OUT" "$HOME/.claude/CLAUDE.md"
link_file "$CODEX_OUT" "$HOME/.codex/AGENTS.md"
link_file "$HOME/.codex/superpowers/skills" "$HOME/.claude/skills"
