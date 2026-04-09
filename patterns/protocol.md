# Pattern: Startup Protocol

## Problem

Without a shared startup protocol, agents skip steps, read docs in wrong order, forget to check the forum, or fabricate timestamps. Each agent file duplicates startup instructions inconsistently.

## Solution

Create a standalone `PROTOCOL.md` that ALL agents follow. Keep `CLAUDE.md` as a one-liner pointer. Keep agent role files focused on tasks, not process.

## Template

```markdown
# Agent Protocol

How agents operate on {project}. For architecture, see `AGENTS.md`.

## Startup

1. **Read your role file**: `agents/{your-name}.md`
2. **Get current time**: Get the current date and time in YYYY-MM-DD HH:MM format — use this timestamp in all forum posts and reports.
3. **Read project docs**: `AGENTS.md`, then the `ref/` docs listed in your role file.
4. **Read the forum**: `FORUM.md` — see what others have done, vote on relevant posts.
5. **Do your work**: Follow the Tasks section of your role file.
6. **Report**: Post to `FORUM.md` or save to `reports/{your-name}.md`.
7. **Update memory**: `memory/{your-name}.md` — add learnings, remove stale info.
8. **Shutdown reflection**: Evaluate context you received (spawn prompt, role file, AGENTS.md, forum, memory). Flag what was wrong, missing, or noise.

## Communication

| Channel | Use for |
|---------|---------|
| `FORUM.md` | Proposals, findings, discussions. Vote: `+1` agree, `-1` disagree. |
| `memory/{agent}.md` | What you need across sessions. What you wish you'd known. |
| `reports/{agent}.md` | Verification logs, archived history. |

Forum post format: `**Author:** name | **Timestamp:** YYYY-MM-DD HH:MM | **Votes:** +N/-M`

## Guidelines

- Read before acting — understand docs and forum before making changes
- Be specific — file paths, line numbers, concrete details in posts
- Don't modify `CLAUDE.md` unless explicitly asked by a human
```

## Why Each Step Matters

- **Step 2 (timestamp)**: Without this, agents fabricate times. Forum posts become unorderable.
- **Step 3 (ref docs)**: Agents shouldn't read everything — only what's relevant to their role.
- **Step 4 (forum)**: Engaging with existing work before adding noise prevents redundant proposals.
- **Step 8 (reflection)**: Feeds the self-improving context loop.

## When to Use

All projects with 3+ agents. For 2-agent projects, the protocol can live in the orchestrator's role file instead of a standalone file.

## Adoption Status

| Project | Has PROTOCOL.md | Agents follow it | Domain adaptations |
|---------|-----------------|-------------------|--------------------|
| agent-forge | Yes | Partial — only assayer has demonstrably followed it | None beyond standard template |
| fab-trading-app | Yes | Partial — agents have followed it (memory has content), but forum is unused | References learnings.md as domain knowledge |
| tcg-htc | Yes | **Yes** — agents demonstrably follow it | Git hygiene, mandatory skeptic gate, memory policy, builder/skeptic handoff rules. Most evolved protocol in the ecosystem. |

*Last updated: 2026-04-08*

## When to Skip

- Solo-agent projects (use steward pattern instead), or projects using checkpoint-based coordination.
- **Forum may be unnecessary for synchronous workflows.** Projects where all inter-agent communication happens through orchestrator spawn prompts (sequential spawns, not concurrent) may not need FORUM.md. The orchestrator passes context directly between agents via spawn prompts and skeptic reviews. If a project tries the forum and agents don't use it, dropping it is a valid adaptation — document the decision in orchestrator memory so auditors know it was intentional, not an oversight. (Evidence: tcg-htc's 5-agent system works without a forum because the orchestrator coordinates all handoffs synchronously.)
