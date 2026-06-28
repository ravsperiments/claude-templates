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

{
  echo "# Global Claude Agent Policy"
  echo
  echo 'This file is generated from `AGENT_POLICY.md`.'
  echo 'Edit the shared source, then run `sync-agent-globals.sh`.'
  echo
  cat "$POLICY"
} > "$CLAUDE_OUT"

{
  echo "# Global Codex Agent Policy"
  echo
  echo 'This file is generated from `AGENT_POLICY.md`.'
  echo 'Edit the shared source, then run `sync-agent-globals.sh`.'
  echo
  cat "$POLICY"
  cat <<'CODEX_EXTRA'

## Codex Skill Bootstrap

<EXTREMELY_IMPORTANT>
You have a lean shared coding-agent skill set. For tasks that match a skill,
load it with `~/.codex/superpowers/.codex/superpowers-codex use-skill <skill-name>`.

Active skills are:

- `superpowers:verification-before-completion`
- `superpowers:systematic-debugging`
- `superpowers:code-review`

Do not bootstrap or load archived skills unless the user explicitly asks.
</EXTREMELY_IMPORTANT>
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
