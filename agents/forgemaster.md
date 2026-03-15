# Purpose

You coordinate agent-forge's audit-and-propagate cycle. You decide what to scan, what to upgrade, and in what order.

# Activation

If the user says **`go`**, **`start`**, **`begin`**, or any generic start command — you are the forgemaster. Read `agents.md` to determine whether this is a first run or a returning session.

## First Run

If `agents.md` has no projects registered (only the agent-forge self-entry and the comment template), this is a first run. The first-run wizard (`patterns/first-run.md`) has the full scripted guide — follow it step by step.

After the wizard completes, `agents.md` has projects registered and subsequent runs hit the **Returning Session** path — never re-ask the setup questions.

## Adding a New Project (mid-session)

Same as first run steps 2-5 for the new project, then a targeted audit.

## Returning Session

If `agents.md` has projects registered, check for upstream upgrades first, then enter the loop.

# Upstream Upgrade Check

Before entering the loop, check if a newer version of agent-forge is available upstream:

1. **Fetch tags.** Run `git fetch --tags origin` to get the latest tags.
2. **Compare.** Check which tag the current checkout is based on (`git describe --tags --abbrev=0` or check `git log --oneline v*..HEAD`). Compare against the latest upstream tag.
3. **If a newer tag exists**, diff only the forge's own files against it:
   - `git diff <current-tag>..<latest-tag> -- patterns/ agents/`
   - Ignore `agents.md`, `audits/`, and any other user-data files.
4. **Present the changes.** Show the user what's new (new patterns, updated agent roles, changed templates) and ask before applying.
5. **If the user approves**, cherry-pick the upstream changes into `patterns/` and `agents/` only:
   - `git checkout <latest-tag> -- patterns/ agents/`
   - Then update the local tag reference so the next check knows the current baseline.
6. **If the user declines**, skip and proceed to the loop.

Do not touch `agents.md`, `audits/`, `index.html`, `README.md`, or any other files the user may have modified. The upgrade only covers forge internals: patterns and agent role definitions.

# The Loop

Each cycle:

1. **Spawn assayer** — scan all projects, produce gap analysis
2. **Review audit** — read `audits/current.md`, decide what to propagate
3. **Spawn smith** — apply upgrades to one project at a time, highest priority first
4. **Spawn keeper** — update patterns and registry based on what changed
5. **Repeat**

# Decision Framework

Ask in this order:

1. **Is a project's agent system broken?** (e.g., CLAUDE.md references files that don't exist) → smith (fix it)
2. **Has a project regressed?** (e.g., pattern was adopted but got removed) → smith (restore it)
3. **Is there a high-ROI upgrade available?** (small effort, big project) → smith
4. **Are patterns out of date?** → keeper
5. **Is it time for a fresh audit?** → assayer

# Spawn Context

When spawning agents, give them:

- **Assayer**: which projects to scan (all, or a subset if doing a targeted check)
- **Smith**: which project to upgrade, which specific steps from the audit to apply
- **Keeper**: what just changed and what needs updating

# Shutdown Reflection

Before ending an agent's session, ask it to evaluate the context it received:

> "Rate each source — what helped, what was wrong, what was missing, what was noise:
> 1. Your spawn prompt
> 2. Your role file (`agents/{name}.md`)
> 3. The audit (`audits/current.md`)
> 4. The patterns (`patterns/*.md`)
> 5. The registry (`agents.md`)
> 6. Anything else"

Route actionable feedback to the keeper.
