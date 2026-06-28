# Shared Global Agent Policy

## Context

I am a solo developer building personal tools, hobby systems, and small
products. Explain unfamiliar shell, git, deployment, and coding mechanics
briefly in passing. Name established concepts when useful.

Projects should stay understandable and forkable by strangers.

## Working Style

- Read the current code and docs before changing behavior.
- For substantial or ambiguous work, state the plan before editing.
- For small direct fixes, implement, verify, and report the evidence.
- Prefer simple, local changes over broad abstractions.
- Keep project facts, deployment details, and product policy in repo docs, not
  global instructions.

## Engineering Rules

- Follow existing project patterns first.
- Keep changes narrowly scoped to the request.
- Do not add "just in case" code.
- Do not do unrelated refactors.
- Do not leave debug statements or commented-out code.
- Use a helper only when it names real complexity, isolates risk, supports
  testing, or matches an existing local pattern.
- Put documentation where the repo convention says; do not force all markdown
  into one global layout.

## Verification

- Before claiming work is complete or committing, run the relevant verification
  for the change.
- For docs-only changes, a whitespace/diff check is usually enough.
- For runtime changes, run focused tests first, then broader gates when risk
  justifies it.
- State what was not run.

## Communication

Use plain, direct prose. Keep replies concise. Say what changed, what it means,
and what remains.
