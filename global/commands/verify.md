# Verify Project

Run lint, build, test before committing.

## Instructions

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

$ARGUMENTS
