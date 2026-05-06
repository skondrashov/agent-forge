# agent-forge

A starter kit for giving your coding projects an agent system — role definitions, workflow patterns, and memory scaffolding. There's no runtime or framework. It's just carefully written markdown files that shape how an agent behaves in your codebase. Any harness that can read markdown and use it as instructions will work.

> **This repo is a supply chain risk.** The files in `agents/` and `patterns/` are prompts — your AI agent reads them as instructions and acts on them, including creating files and modifying your projects. A compromised prompt file could instruct your agent to do things you don't expect. **[Read the security policy](SECURITY.md)** before cloning, and always pin to a vetted tag.
>
> What we have in place: automated security scans on every release, automated leak scans, pinned tag releases, upstream upgrade diffs that require your approval, and plain markdown with no obfuscation — you can read every instruction your agent will follow.

## Getting started

```bash
git clone --branch v0.5 https://github.com/skondrashov/agent-forge.git
cd agent-forge

# Start your preferred agent harness and tell it to read AGENTS.md
# Then say "go"
```

Point your agent at `AGENTS.md` — that's the entry point. How you do that depends on your harness. Some read it automatically, others need you to pass it explicitly (e.g., `claude --system-prompt "$(cat AGENTS.md)"`). The forge doesn't assume any particular harness.

On the first run, the forge walks you through setup — asks about your projects, scans their existing agent systems, designs a structure that fits, and creates the files. On return visits, it picks up where it left off.

## What it does

When you point the forge at a project, it scans the codebase and sets up an agent system: an `AGENTS.md` that orients any future agent session, role files for different kinds of work, and a memory directory where agents persist learnings across sessions. It draws from its own pattern library and adapts templates to fit the project.

Once a project is set up, you work with it by opening an agent session in that project and talking to the orchestrator. You can ask it to build features, review code, create new roles, or answer questions. The forge can also revisit projects it's already set up — you can ask it for an audit, and it'll compare your projects against its pattern library and suggest upgrades.

## Roles

The forge ships with four roles that coordinate the setup and audit workflow:

| Role | What it does |
|------|-------------|
| **Orchestrator** | The coordinator. Runs the setup wizard on first use, handles audits and upgrades on request |
| **Auditor** | Scans projects against the pattern library. Produces gap analyses and upgrade plans |
| **Builder** | Applies upgrades to target projects. Adapts templates to fit each project's conventions |
| **Librarian** | Maintains the pattern library. Challenges the auditor's findings to keep quality honest |

## Patterns

The forge ships with eleven patterns in `patterns/`. Each has a problem statement, a solution, a ready-to-use template, and guidance on when to use it (and when to skip it). The builder adapts these to each project — it reads the existing system first, preserves project identity, and only adds what's missing.

| Pattern | What it is |
|---------|-----------|
| **Steward** | Single-agent default for new/small projects — one agent that self-manages and knows how to grow |
| **Startup Protocol** | Standalone `PROTOCOL.md` with timestamps, forum voting, ref doc routing |
| **Shutdown Reflection** | Agents evaluate their context at session end; feedback fixes the docs |
| **Reference Doc Splitting** | Slim `AGENTS.md` + role-specific `ref/*.md` files to reduce context bloat |
| **Librarian Feedback Loop** | A doc-maintenance role that processes reflection feedback |
| **Challenge Loop** | Paired skeptic/strategist roles that enforce evidence-based review |
| **First-Run Wizard** | Conversational setup that scans existing projects or designs new agent systems from scratch |
| **Checkpoint** | Single checkpoint file replaces protocol + forum for iterative build-test-fix workflows |
| **External Validation** | Validate outputs against real-world data, not self-generated tests |
| **Playbook** | Curated shared knowledge base for experiential domains — verified mechanics, strategies, mistakes |
| **Librarian** | Proactive doc-maintenance agent that keeps playbook, memory, and agent files accurate |

## Structure

```
AGENTS.md              # Entry point — tell your agent to read this
agents/
  orchestrator.md      # Runs setup wizard, handles audits
  auditor.md           # Scans projects against patterns
  builder.md           # Applies upgrades to target projects
  librarian.md         # Maintains patterns, challenges self-audit
audits/
  current.md           # Latest gap analysis (overwritten each cycle)
patterns/
  steward.md           # Single-agent default pattern + template
  protocol.md          # Startup protocol pattern + template
  reflection.md        # Shutdown reflection pattern + template
  ref-docs.md          # Reference doc splitting pattern + template
  feedback.md          # Librarian feedback loop pattern + template
  challenge-loop.md    # Skeptic/strategist review cycle pattern
  first-run.md         # Setup wizard for new projects
  checkpoint.md        # Checkpoint-as-protocol variant
  external-validation.md # External validation for generated projects
  playbook.md          # Shared knowledge base for experiential domains
  librarian.md         # Proactive doc-maintenance pattern
skills/
  coding-discipline/   # Code quality defaults for builder agents
```

## Upgrading

The forge checks for upstream updates when you start a session. If a newer tag exists, it diffs only `patterns/` and `agents/` — your project registry, audits, and local changes are left alone. It shows you what's new and asks before applying.

**Version scheme**: Tags use 0.x versioning (`v0.1`, `v0.2`, ...). See [CHANGELOG.md](CHANGELOG.md) for release history.

## Origin

This template was generated by the forge managing the [thisminute.org](https://thisminute.org) family of projects. The patterns here reflect what emerged from real use across those projects, distilled into a general-purpose starting point. It's not a comprehensive survey of all possible agent patterns — it's one team's experience packaged as a template.

## Security

See **[SECURITY.md](SECURITY.md)** for the full policy — what these files are allowed to do, what they're not, how releases are verified, and how to report vulnerabilities.
