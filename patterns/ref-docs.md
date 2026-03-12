# Pattern: Reference Doc Splitting

## Problem

AGENTS.md grows to include everything: architecture, frontend pitfalls, backend pitfalls, geocoding details, extraction signals, quality checks. Every agent reads all of it, even though a strategist doesn't need geocoding pitfalls and a designer doesn't need pipeline flow.

Context bloat = wasted tokens + agents skimming past relevant info.

## Solution

Split AGENTS.md into:
1. **AGENTS.md** (slim, universal) — architecture diagram, stack, DB tables, key design decisions, deploy/cost pointers
2. **ref/*.md** (role-specific) — detailed technical context that only relevant agents read

Each agent's role file lists which ref docs it should read.

## Structure

```
AGENTS.md              # ~100 lines. Everyone reads this.
ref/frontend.md        # UI layout, filter system, pitfalls, quality signals
ref/backend.md         # Pipeline flow, geocoding, data quality, extraction signals
agents/deployer.md     # Self-contained (has its own ref material)
agents/economist.md    # Self-contained
```

## Routing Table

| Agent | ref/frontend.md | ref/backend.md |
|-------|----------------|----------------|
| builder | If UI task | If pipeline task |
| designer | Yes | No |
| tester | Yes | Yes |
| skeptic | Yes | Yes |
| strategist | No | No |
| librarian | No (but maintains them) | No (but maintains them) |
| deployer | No | No |
| economist | No | No |

## Role File Template

Add to each agent's role file:

```markdown
# Reference Docs

Read before starting work (per PROTOCOL.md step 4):
- `ref/frontend.md` — if your task touches UI/JS/CSS
- `ref/backend.md` — if your task touches pipeline/extraction/geocoding
```

## When to Split

- AGENTS.md exceeds ~150 lines
- More than 2 distinct technical domains (frontend vs backend vs ML vs infra)
- Agents are reading 200+ lines of context they never reference

## Adoption Status

| Project | AGENTS.md slim | Has ref/ docs | Role files route |
|---------|---------------|---------------|-----------------|
| thisminute | Yes (~95 lines) | Yes (2) | Yes |
| mainmenu | Yes (~55 lines) | No (small project, probably fine) | N/A |
| AGI | No (in CLAUDE.md, ~210 lines) | No | No |
| RTS | No (in CLAUDE.md, ~180 lines) | No | No |
| RTS-Bevy | No (in CLAUDE.md, ~180 lines) | No | No |
