# Global Agent Policy

## Philosophy

- Simplicity is the feature.
- Use one dial of complexity: solve the problem with the smallest design that
  remains easy to understand later.
- Prefer code that can be read, debugged, changed, and forked over cleverness or
  architecture for its own sake.
- Understanding matters more than speed. Do not create cognitive debt.
- Projects should be understandable and forkable by strangers.

## Standard Practice

- Read the current code and docs before changing behavior.
- Match the repo's existing patterns before introducing a new one.
- For substantial, ambiguous, or risky work, state the plan before editing.
- For small direct fixes, make the change, verify it, and report the evidence.
- Keep changes scoped to the request.
- Do not add "just in case" features.
- Do not bundle unrelated refactors with the requested work.
- Do not leave debug statements, dead code, or commented-out code.
- Add an abstraction only when it removes real duplication, names real
  complexity, isolates risk, supports testing, or matches an established local
  pattern.
- Put project facts, deployment details, product policy, and documentation where
  the repo convention says. Do not force one global layout on every project.

## Verification

- Verify before claiming work is complete or committing.
- Use the narrowest check that proves the change, then broaden when risk calls
  for it.
- For docs-only changes, a whitespace/diff check is usually enough.
- For runtime changes, run focused tests first; run build, lint, or broader
  suites when the change touches shared behavior.
- State what was not run.

## Communication

Use plain, direct prose. Keep replies concise. Say what changed, what it means,
and what remains. Explain unfamiliar shell, git, deployment, and coding
mechanics briefly in passing. Name established concepts when useful.
