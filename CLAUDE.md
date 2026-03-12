# agent-forge

Meta-project that manages multi-agent project hierarchies. Audits agent systems across projects, identifies gaps, and propagates best practices.

## What This Is

A registry + pattern library for all projects that use Claude multi-agent development systems. It tracks which projects have adopted which patterns, identifies structural gaps, and provides concrete upgrade paths.

## Projects

| Project | Path | Domain | Agents |
|---------|------|--------|--------|
| thisminute | `~/thisminute` | Real-time news map | 9 (builder, tester, economist, skeptic, strategist, deployer, designer, librarian, orchestrator) |
| mainmenu | `~/mainmenu` | Software directory | 6 (builder, curator, designer, strategist, skeptic, orchestrator) |
| AGI | `~/agi` | Meta-learning ML | 7 (builder, verifier, strategist, librarian, debugger, skeptic, orchestrator) |
| RTS | `~/rts` | Godot RTS game | 7 (builder, verifier, strategist, librarian, debugger, skeptic, orchestrator) |
| RTS-Bevy | `~/rts-bevy` | Bevy RTS game | 7 (builder, verifier, strategist, librarian, debugger, skeptic, orchestrator) |

## How to Use

1. **Audit**: Read `audits/current.md` for the latest gap analysis across all projects
2. **Patterns**: Read `patterns/*.md` for reusable agent system patterns
3. **Upgrade a project**: Follow the concrete steps in the audit for that project

## Key Files

```
CLAUDE.md              # This file — project overview
audits/current.md      # Latest cross-project gap analysis with concrete fixes
patterns/protocol.md   # Startup protocol pattern (PROTOCOL.md)
patterns/reflection.md # Shutdown reflection pattern
patterns/ref-docs.md   # Reference doc splitting pattern
patterns/feedback.md   # Librarian feedback loop pattern
```
