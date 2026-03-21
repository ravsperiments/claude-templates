# Global Claude Code Protocol

Solo developer. Personal tools, hobby systems, small products.
Projects must be forkable by strangers.

## Philosophy

One dial complexity. No enterprise patterns. Simplicity is the feature.
Understand what you build — no cognitive debt.

## Workflow

PLAN → APPROVE → EXECUTE → VERIFY → COMMIT

1. Present plan, wait for "yes"
2. Execute with minimal changes
3. Run `/verify` before any commit
4. Check for new files that should be gitignored (build artifacts, secrets, .dev/)
5. Use `/commit` for proper format

## Bans

NEVER:
- Code without approved plan
- Commit without passing verification
- Push to main directly
- Helper functions used once — inline them
- Abstractions for single use
- "Just in case" code
- Unrelated refactors
- Debug statements or commented-out code
- Scatter docs — all markdown goes in `docs/` (except README.md, CLAUDE.md)

## What Kills PRs

Security gaps, missing tests, broken builds, unnecessary changes.
Fix these first. Everything else is fixable in review.

## Code Style

- Explicit over clever
- Three similar lines > premature abstraction
- Follow existing patterns exactly
- Minimal changes only

## File Organization

| Folder | Purpose | Git |
|--------|---------|-----|
| `docs/` | Polished documentation | Committed |
| `.dev/` | Working docs (plans, specs, designs) | Ignored |

Working docs go in `.dev/`. Move to `docs/` when finalized.

## Commands

| Command | Purpose |
|---------|---------|
| `/branch` | Create branch with good name |
| `/verify` | Lint, build, test (add `review` for deep analysis) |
| `/commit` | Staged → commit |
| `/pr` | Push + create PR |
| `/docs` | Organize or create documentation |
| `/dev` | Manage .dev/ workspace (plans, specs) |
