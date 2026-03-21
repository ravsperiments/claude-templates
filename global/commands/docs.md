# Organize Documentation

Keep docs organized, never scattered.

## Default Structure

```
project/
├── README.md              # Project overview only
├── CLAUDE.md              # Claude instructions
└── docs/
    ├── spec.md            # Business requirements (what & why)
    ├── architecture.md    # Technical design (how)
    ├── plan.md            # Execution plan (when & order)
    ├── getting-started.md
    ├── api.md
    └── features/
        └── <feature-name>/
            ├── spec.md    # Feature requirements
            ├── design.md  # Feature technical design
            └── plan.md    # Feature implementation plan
```

## Standard Doc Types

### spec.md — Business Requirements

```markdown
# <Project/Feature> Spec

## Problem
What problem are we solving? Why does this matter?

## Goals
- Goal 1
- Goal 2

## Non-Goals
What we're explicitly NOT doing.

## Requirements
| ID | Requirement | Priority |
|----|-------------|----------|
| R1 | Description | Must/Should/Could |

## Success Criteria
How do we know this is done?
```

### architecture.md — Technical Design

```markdown
# <Project/Feature> Architecture

## Overview
High-level technical approach in 2-3 sentences.

## Components
| Component | Purpose |
|-----------|---------|
| Name | What it does |

## Data Flow
How data moves through the system. Use simple diagrams if needed.

## Dependencies
External services, libraries, APIs.

## Constraints
Technical limitations, performance requirements.

## Decisions
| Decision | Rationale |
|----------|-----------|
| Choice made | Why |
```

### design.md — Feature Technical Design

```markdown
# <Feature> Design

## Approach
How we're building this feature.

## Changes
| File/Component | Change |
|----------------|--------|
| path/to/file | What changes |

## Interface
API, props, or function signatures.

## Edge Cases
How we handle them.
```

### plan.md — Execution Plan

```markdown
# <Project/Feature> Plan

## Phases
| Phase | Description | Depends On |
|-------|-------------|------------|
| 1 | What to do first | - |
| 2 | What comes next | Phase 1 |

## Tasks
- [ ] Task 1
- [ ] Task 2

## Risks
| Risk | Mitigation |
|------|------------|
| What could go wrong | How we handle it |
```

## Naming Convention

| Pattern | Example | Use for |
|---------|---------|---------|
| `kebab-case.md` | `getting-started.md` | Standard docs |
| `UPPERCASE.md` | `README.md` | Root-level special files only |

Rules:
- Always lowercase with hyphens: `api-reference.md` not `API_Reference.md`
- No spaces or underscores: `quick-start.md` not `quick_start.md`
- Be specific: `auth-flow.md` not `auth.md`
- No version numbers: `migration.md` not `migration-v2.md`

Reserved uppercase names (root only):
- `README.md`, `CLAUDE.md`, `CHANGELOG.md`, `LICENSE.md`

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

If $ARGUMENTS is "sync" or "update":
1. Review git history for recent changes:
   ```bash
   git log --oneline -20
   git diff --stat HEAD~10
   ```
2. Check if README.md reflects current state:
   - Project description accurate?
   - Install/usage instructions current?
   - Features list up to date?
3. Check if CHANGELOG.md needs updating (if exists)
4. Scan docs/ for outdated content
5. Propose updates, ask for confirmation before editing

If $ARGUMENTS is "readme":
1. Analyze codebase: package.json, main files, structure
2. Review recent git history for context
3. Generate/update README.md using template below
4. Keep it concise — link to docs/ for details

## README Template

```markdown
# Project Name

One-line description of what this does.

## Quick Start

\`\`\`bash
# Install
<install command>

# Run
<run command>
\`\`\`

## What It Does

2-3 sentences explaining the core functionality.
No marketing speak. Just what it does.

## Usage

\`\`\`bash
# Basic example
<command or code>
\`\`\`

## Configuration

| Option | Default | Description |
|--------|---------|-------------|
| `option` | `value` | What it does |

(Only if config exists. Skip if not needed.)

## Project Structure

\`\`\`
src/
├── main.ts      # Entry point
└── lib/         # Core logic
\`\`\`

(Only for non-obvious structures. Skip for simple projects.)

## License

MIT (or whatever applies)
```

### README Rules

- No badges unless meaningful
- No "Features" list with checkmarks
- No screenshots unless essential
- No "Contributing" section for solo projects
- Quick Start must actually work — test it
- Link to docs/ for anything longer than 3 lines

If $ARGUMENTS is "spec", "architecture", or "plan":
1. Create the doc in `docs/` using the template above
2. Pre-fill sections based on codebase analysis
3. Ask user to review and refine

If $ARGUMENTS is "feature <name>":
1. Create `docs/features/<name>/` directory
2. Create spec.md, design.md, plan.md using templates
3. Pre-fill based on any existing context

If $ARGUMENTS is other text:
1. Create the requested doc in `docs/` folder
2. Use clear heading structure
3. Keep it concise

## Examples

```
/docs                     # Find and organize scattered docs
/docs sync                # Update docs based on git history
/docs update              # Same as sync
/docs readme              # Update README.md from codebase
/docs spec                # Create docs/spec.md from template
/docs architecture        # Create docs/architecture.md from template
/docs plan                # Create docs/plan.md from template
/docs feature auth        # Create docs/features/auth/ with spec, design, plan
/docs api reference       # Create docs/api-reference.md
```

$ARGUMENTS
