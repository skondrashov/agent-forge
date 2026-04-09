# Pattern: Keeper Feedback Loop

## Problem

Without a dedicated doc-maintenance agent, documentation decays:
- Forum fills with resolved threads
- Memory files accumulate stale info
- AGENTS.md drifts from reality
- Agent role files reference deleted features

The shutdown reflection pattern generates feedback, but without someone to process it, the feedback is wasted.

In practice, forums grow fast. One project's forum went from 51 to 621 lines in a single session. Another hit 904 lines across 7 cycles before a librarian was added. The pattern isn't optional for projects with active forums — it's load-bearing.

## Solution

A keeper agent (or doc-maintenance role by any name) that:
1. Cleans the forum — archives resolved threads, merges duplicates
2. Maintains memory files — removes stale info, consolidates duplicates
3. Keeps docs current — cross-references claims against code
4. Processes context feedback — applies agent shutdown reflections to the right files

## Minimum Viable Keeper

Even projects without a dedicated keeper agent can get 80% of the value by adding these tasks to the forgemaster:

```markdown
## Between Agent Spawns

After reading an agent's output and before spawning the next:
1. If the agent flagged wrong docs → fix them now (takes 30 seconds)
2. If the forum is getting long → move resolved threads to reports/
3. If memory files were mentioned as stale → check and update
```

## Full Keeper Template

For projects with a dedicated keeper, include:
- Forum cleaning (archive resolved threads, remove excessive downvotes)
- Memory maintenance (remove stale info, consolidate)
- Doc currency checks (cross-reference AGENTS.md against code)
- Context feedback processing (apply shutdown reflections to the right files)
- Agent file maintenance (are instructions clear, tasks well-defined?)

## When to Use

- Projects with 5+ agents (enough communication to need cleanup)
- Projects where the forum grows past ~200 lines per cycle
- Projects where doc quality visibly decays between audits

## When to Skip

- Projects with 2-3 agents (forgemaster can self-maintain)
- Projects with short, focused agent sessions (not enough drift to matter)

## Adoption Status

| Project | Has keeper | Processes feedback | Forum cleanup |
|---------|--------------|-------------------|---------------|
| agent-forge | Yes (role exists) | No — keeper has never run | N/A (forum has 2 posts) |
| fab-trading-app | No | Partial — orchestrator has between-spawns cleanup | N/A (forum never used) |
| tcg-htc | No (orchestrator fills this role) | Partial — orchestrator fixes flagged docs between spawns | N/A (forum intentionally dropped) |

*Last updated: 2026-04-08*
