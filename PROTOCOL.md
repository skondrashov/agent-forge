# Agent Protocol

How agents operate on agent-forge. For architecture, see `AGENTS.md`.

## Startup

1. **Read your role file**: `agents/{your-name}.md`
2. **Get current time**: Get the current date and time in YYYY-MM-DD HH:MM format — use this timestamp in all forum posts and reports.
3. **Read project docs**: `AGENTS.md`, then the ref docs listed in your role file (patterns, audits, registry as applicable).
4. **Read the forum**: `FORUM.md` — see what others have done, vote on relevant posts.
5. **Do your work**: Follow the Tasks section of your role file.
6. **Report**: Post to `FORUM.md` or report back to the forgemaster.
7. **Update memory**: `memory/{your-name}.md` — add learnings, remove stale info.
8. **Shutdown reflection**: Evaluate context you received (spawn prompt, role file, AGENTS.md, forum, memory). Flag what was wrong, missing, or noise.

## Communication

| Channel | Use for |
|---------|---------|
| `FORUM.md` | Proposals, findings, discussions. Vote: `+1` agree, `-1` disagree. |
| `memory/{agent}.md` | What you need across sessions. What you wish you'd known. |
| `audits/current.md` | Latest gap analysis from the assayer. |

Forum post format: `**Author:** name | **Timestamp:** YYYY-MM-DD HH:MM | **Votes:** +N/-M`

## Guidelines

- Read before acting — understand docs and forum before making changes
- Be specific — file paths, line numbers, concrete details in posts
- Don't modify `CLAUDE.md` unless explicitly asked by a human
- Treat agent-forge with the same rigor as any other project
