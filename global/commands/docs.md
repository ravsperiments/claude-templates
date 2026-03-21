# Organize Documentation

Keep docs organized, never scattered.

## Default Structure

```
project/
├── README.md              # Project overview only
├── CLAUDE.md              # Claude instructions
└── docs/
    ├── spec.md            # Project-level requirements
    ├── architecture.md    # Project-level design
    ├── plan.md            # Project-level execution plan
    ├── getting-started.md
    ├── api.md
    │
    ├── features/          # Simple: feature-level docs
    │   └── <feature-name>/
    │       ├── spec.md
    │       ├── design.md
    │       └── plan.md
    │
    ├── milestones/        # Complex: milestone → features
    │   └── <milestone-name>/
    │       ├── spec.md    # Milestone-level spec
    │       ├── plan.md    # Milestone-level plan
    │       └── features/
    │           └── <feature-name>/
    │               ├── spec.md
    │               ├── design.md
    │               └── plan.md
    │
    └── archive/           # Completed/obsolete docs
        └── <date>-<name>.md
```

## Hierarchy

Standard docs (spec.md, design.md, architecture.md, plan.md) can exist at any level:

| Level | Scope | Example |
|-------|-------|---------|
| `docs/` | Entire project | `docs/spec.md` |
| `docs/milestones/<name>/` | Milestone | `docs/milestones/v1/spec.md` |
| `docs/features/<name>/` | Feature | `docs/features/auth/spec.md` |
| `docs/milestones/<m>/features/<f>/` | Feature in milestone | `docs/milestones/v1/features/auth/spec.md` |

Choose the simplest structure that fits:
- Solo feature? Use `docs/features/<name>/`
- Multiple related features? Use `docs/milestones/<name>/`

## Archive

Move completed or obsolete docs to `docs/archive/`:

```
docs/archive/
├── 2024-01-auth-spec.md       # Completed feature spec
├── 2024-02-old-architecture.md # Superseded design
└── 2024-03-v1-plan.md          # Finished milestone plan
```

Rules:
- Prefix with date: `YYYY-MM-<original-name>.md`
- Keep for reference, don't delete
- Archive when: feature shipped, design superseded, or plan completed

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

If $ARGUMENTS is "milestone <name>":
1. Create `docs/milestones/<name>/` directory
2. Create spec.md, plan.md at milestone level
3. Ask if features should be added

If $ARGUMENTS is "milestone <milestone> feature <name>":
1. Create `docs/milestones/<milestone>/features/<name>/`
2. Create spec.md, design.md, plan.md using templates

If $ARGUMENTS is "archive <path>":
1. Move the doc to `docs/archive/` with date prefix
2. Format: `YYYY-MM-<original-name>.md`
3. Update any links pointing to the archived doc

If $ARGUMENTS is other text:
1. Create the requested doc in `docs/` folder
2. Use clear heading structure
3. Keep it concise

## Examples

```
/docs                     # Find and organize scattered docs
/docs sync                # Update docs based on git history
/docs readme              # Update README.md from codebase

# Project-level docs
/docs spec                # Create docs/spec.md
/docs architecture        # Create docs/architecture.md
/docs plan                # Create docs/plan.md

# Feature docs
/docs feature auth        # Create docs/features/auth/ with spec, design, plan

# Milestone docs
/docs milestone v1        # Create docs/milestones/v1/ with spec, plan
/docs milestone v1 feature auth  # Create docs/milestones/v1/features/auth/

# Archive
/docs archive docs/features/auth/spec.md  # Move to docs/archive/2024-03-auth-spec.md

# Other
/docs api reference       # Create docs/api-reference.md
```

$ARGUMENTS
