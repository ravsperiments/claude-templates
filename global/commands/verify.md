# Verify Project

Run lint, build, test before committing. Optionally perform deep code review.

## Usage

- `/verify` — Run lint, build, test
- `/verify review` — Deep code quality review

## Standard Verification

1. Detect stack from files:

| File | Commands |
|------|----------|
| `package.json` | `npm run lint && npm run build && npm test` |
| `pyproject.toml` | `ruff check . && pytest` |
| `Cargo.toml` | `cargo clippy && cargo build && cargo test` |
| `go.mod` | `go vet ./... && go build ./... && go test ./...` |
| `Makefile` | `make lint && make build && make test` |

2. Check project CLAUDE.md for custom commands
3. Run each command in sequence
4. Report results:

```
Verification:
- Lint: PASS/FAIL
- Build: PASS/FAIL
- Test: PASS/FAIL

Ready to commit: YES/NO
```

If ANY fails: show error, suggest fix, do NOT proceed.

## Deep Review (`/verify review`)

Analyze codebase for quality and philosophy adherence. No commands run — this is static analysis.

### 1. Philosophy Violations

Scan for banned patterns:

| Violation | What to find |
|-----------|--------------|
| Single-use helpers | Functions called only once — should be inlined |
| Single-use abstractions | Interfaces/classes with one implementation |
| "Just in case" code | Unused parameters, empty catch blocks, dead branches |
| Debug artifacts | `console.log`, `print()`, `debugger`, commented-out code |
| Scattered docs | `.md` files outside `docs/` (except README.md, CLAUDE.md) |

### 2. File Structure

Check organization:

| Check | Expected |
|-------|----------|
| `.dev/` ignored | Must be in `.gitignore` if `.dev/` exists |
| Docs location | Markdown in `docs/` or root (README.md, CLAUDE.md only) |
| No orphans | No unused/unreferenced files |
| Clean root | Minimal files in project root |

### 3. Complexity Signals

Flag over-engineering:

| Signal | Example |
|--------|---------|
| Enterprise patterns | Factories, DI containers, service locators |
| Excessive abstraction | >2 levels of inheritance, decorator stacking |
| Config bloat | Multiple config formats, environment matrices |
| Wrapper functions | Functions that just call another function |

### 4. Report Format

```
Code Review:
- Philosophy: PASS/ISSUES (n found)
- Structure: PASS/ISSUES (n found)
- Complexity: PASS/ISSUES (n found)

Score: X/10

[If issues found, list each with file:line and recommendation]
```

### 5. Scoring

| Score | Meaning |
|-------|---------|
| 10 | Clean — no issues found |
| 8-9 | Good — minor notes only |
| 6-7 | Fair — some warnings, no blockers |
| 4-5 | Needs work — multiple warnings |
| 1-3 | Poor — blockers present |

Deductions:
- Block issue: -3 each
- Warn issue: -1 each
- Note: -0.5 each (cap at -2 total)

### 6. Severity

- **Block**: Security issues, obvious bugs
- **Warn**: Philosophy violations, complexity
- **Note**: Style suggestions, minor improvements

Only "Block" items prevent commit. Others are recommendations.

$ARGUMENTS
