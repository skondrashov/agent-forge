# Pattern: Librarian Feedback Loop

## Problem

Without a dedicated doc-maintenance agent, documentation decays:
- Forum fills with resolved threads
- Memory files accumulate stale info
- AGENTS.md drifts from reality
- Agent role files reference deleted features

The shutdown reflection pattern generates feedback, but without someone to process it, the feedback is wasted.

## Solution

A librarian agent (or doc-maintenance role by any name) that:
1. Cleans the forum — archives resolved threads, merges duplicates
2. Maintains memory files — removes stale info, consolidates duplicates
3. Keeps docs current — cross-references claims against code
4. Processes context feedback — applies agent shutdown reflections to the right files

## Minimum Viable Librarian

Even projects without a dedicated librarian agent can get 80% of the value by adding these tasks to the orchestrator:

```markdown
## Between Agent Spawns

After reading an agent's output and before spawning the next:
1. If the agent flagged wrong docs → fix them now (takes 30 seconds)
2. If the forum is getting long → move resolved threads to reports/
3. If memory files were mentioned as stale → check and update
```

## Full Librarian Template

See `~/thisminute/agents/librarian.md` for the most evolved version, which includes:
- Forum cleaning (7 tasks)
- Memory maintenance
- Doc currency checks
- Cross-reference verification
- Agent catalog updates
- Context feedback processing
- Code hygiene audits

## Adoption Status

| Project | Has librarian | Processes feedback | Forum cleanup |
|---------|--------------|-------------------|---------------|
| thisminute | Yes (full) | Yes | Yes |
| mainmenu | No | No | No |
| AGI | Yes (basic) | No | Basic |
| RTS | Yes (basic) | No | Basic |
| RTS-Bevy | Yes (basic) | No | Basic |
