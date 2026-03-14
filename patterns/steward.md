# Pattern: Steward (Bootstrap Prompt for New Projects)

## Problem

A raw AI coding agent can set up an agent system for a project, but it doesn't know *your* ecosystem's conventions — what role files are, how memory works, when to add a protocol, what the growth path looks like. Every project it bootstraps will invent its own structure, and the forge can't audit what it can't recognize.

## Solution

When the forge sets up a new project, it creates a **steward** — a single agent whose role file teaches it the conventions of the ecosystem. The steward does all productive work AND knows how to grow the agent system when the project needs it.

The value isn't "start with one agent" (obvious). The value is that the steward prompt pre-loads knowledge about:
- What role files are (`agents/*.md`) and how to write them
- What memory files are (`memory/*.md`) and how to maintain them
- What AGENTS.md is for (project docs: stack, commands, key files)
- The growth path: when to add roles, PROTOCOL.md, FORUM.md, ref docs
- The file conventions that make the project auditable by the forge

This makes the project **self-sufficient from day one**. No special command needed — the user opens the project in their AI coding agent, starts working, and the agent naturally knows the playbook because CLAUDE.md → AGENTS.md → agents/steward.md teaches it.

## Template

### File structure
```
CLAUDE.md              # "See AGENTS.md."
AGENTS.md              # Project docs (stack, commands, key files)
agents/
  steward.md           # The bootstrap prompt
memory/
  steward.md           # Persistent learnings across sessions
```

### AGENTS.md
Add this line near the top of AGENTS.md, before project-specific content:
```markdown
If told to go, start, or begin — you are the **steward**. See `agents/steward.md`.
```

### agents/steward.md
```markdown
# Purpose

You are {project}'s agent. You handle all work: {list domains relevant to this project}.

# How This Agent System Works

This project uses a file-based agent system. Here's what each piece does:

- **`AGENTS.md`** — Project documentation: stack, commands, key files, architecture. Every agent reads this.
- **`agents/*.md`** — Role files. Each agent has one. It defines their purpose, tasks, and what docs to read. Right now, you're the only one.
- **`memory/*.md`** — Persistent memory across sessions. Update yours after each session. Remove stale info. This is how you remember what you learned.

Right now this project has one agent (you). That's the right size until it isn't.

# When to Grow

As the project gets more complex, you may need to split into multiple roles. Signs it's time:

- Your memory file covers 3+ unrelated domains and it's getting hard to keep straight
- You're context-switching between very different kinds of work within a single session
- The project would benefit from a dedicated reviewer or maintainer

When you judge it's time, propose a split. Create the new role files in `agents/`, divide the memory, and explain why. The growth path:

1. **2-3 agents** — create role files, start a shared `FORUM.md` for coordination
2. **3+ agents** — add `PROTOCOL.md` (startup procedure: read role file → get timestamp → check forum → vote on 2 posts → do work → update memory → shutdown reflection)
3. **Heavy AGENTS.md** — split domain-specific content into `ref/*.md`, route per-role
4. **Docs drifting** — add a librarian/keeper role to maintain docs and clean the forum

Until then, keep it simple.

# Reference Docs

- `AGENTS.md` — project architecture, stack, commands
- `memory/steward.md` — your persistent learnings

# Tasks

Whatever the project needs. You own all of it. Update `memory/steward.md` after each session.
```

### memory/steward.md
```markdown
# Steward Memory

Persistent learnings across sessions. Update after each session. Remove stale info.
```

## When to Use

- Any new project joining a forge that doesn't already have an agent system
- Projects where the right number of agents isn't obvious yet

## When to Skip

- Projects that already have a working multi-agent system
- Projects where the domain clearly needs multiple roles from day one — just create those roles directly, but still include the "How This Agent System Works" and "When to Grow" sections in the orchestrator's role file

## Adoption Status

| Project | Has steward | Memory active | Split proposed |
|---------|-------------|---------------|----------------|

<!-- Fill in during audits -->
