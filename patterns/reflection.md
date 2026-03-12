# Pattern: Shutdown Reflection

## Problem

Agent context (role files, AGENTS.md, memory, forum) drifts from reality over time. Agents encounter wrong info, missing context, or noise, but there's no mechanism to fix it. The same gaps burn every agent that spawns.

## Solution

Before ending an agent's session, the orchestrator asks it to evaluate each layer of context it received. Feedback is routed to the librarian (or equivalent doc-maintenance agent) for processing.

## Template — Add to orchestrator.md

```markdown
## Shutdown Reflection

Before ending an agent's session, ask it to evaluate **each layer of context** it received:

> "Before you wrap up, I need your feedback on the context you were given at the start of this session. Rate each source and be specific about what helped, what was wrong, what was missing, and what was noise:
>
> 1. **My spawn prompt** (the task description and context I gave you) — Was the scope clear? Did I give you enough background?
> 2. **Your role file** (`agents/{name}.md`) — Was it accurate? Were any instructions outdated?
> 3. **AGENTS.md** (architecture, key design decisions) — Did you reference it? Was it accurate?
> 4. **Reference docs** (`ref/*.md`) — If you read them, were they useful? Anything missing?
> 5. **PROTOCOL.md** (startup procedure) — Was the process clear?
> 6. **Memory files** (`memory/{name}.md`) — Were they current? Any stale info?
> 7. **Forum / messages** — Were existing threads useful or just noise?
> 8. **Anything else** — Files you had to hunt for. Things you learned the hard way."

Capture the response and:
1. **Actionable feedback** → send to the librarian (`messages/librarian.md`)
2. **Quick fixes** (wrong file path, stale note) → fix immediately
3. **Pattern detection** — if multiple agents flag the same gap, add it to AGENTS.md
4. **Spawn prompt improvements** → adjust your own approach
```

## Template — Add to librarian.md (or equivalent)

```markdown
## Process Agent Context Feedback

Context layers and where to fix them:

| Layer | File(s) to update |
|---|---|
| Spawn prompt | `orchestrator.md` |
| Role file | `agents/{name}.md` |
| AGENTS.md | `AGENTS.md` |
| Reference docs | `ref/*.md` |
| PROTOCOL.md | `PROTOCOL.md` |
| Memory files | `memory/*.md` |
| Forum/messages | `FORUM.md`, `messages/*.md` |

For each piece of feedback: identify the layer, verify the claim, fix it in the right place.
```

## The Self-Improving Context Loop

```
Agents identify gaps → Orchestrator captures per-layer feedback
→ Librarian fixes the specific doc → Next spawn starts with better context
```

Without BOTH the orchestrator collection AND the librarian processing, the loop is broken.

## Adoption Status

| Project | Orchestrator collects | Librarian processes | Loop complete |
|---------|----------------------|--------------------|-|
| thisminute | Yes | Yes | Yes |
| mainmenu | No | No | No |
| AGI | No | No | No |
| RTS | No | No | No |
| RTS-Bevy | No | No | No |
