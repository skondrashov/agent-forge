# Pattern: SECURITY.md for Agent Repos

## Problem

Agent system repos contain prompt files (markdown documents) that AI agents read and execute as instructions. When these repos are public, anyone can submit a PR that modifies agent instructions. A compromised prompt file can instruct an AI agent to exfiltrate data, install backdoors, or modify code in harmful ways — all while appearing to do legitimate work.

This is a supply-chain risk unique to agent systems. Traditional SECURITY.md files cover code vulnerabilities. Agent repos also need to cover prompt file integrity.

## Solution

Add a `SECURITY.md` to any agent repo that is (or may become) public. The file defines:

1. **What the repo is** — explicitly states that it contains prompt files that control AI agent behavior.
2. **What agent files are allowed to do** — a whitelist of permitted operations (read project files, run project tests, create/modify agent files, run scoped git commands).
3. **What agent files must never do** — a denylist of prohibited operations (read secrets, make unsolicited network requests, access system paths, push/deploy without confirmation, encode/obfuscate content, suppress user review).
4. **How to verify** — instructions for users to audit agent files before running them.
5. **How to report** — a channel for reporting prompt injection or scope violations (GitHub Security Advisory or direct contact).

## Template

```markdown
# Security Policy

## What this repo is

This repository contains code **and prompt files** — markdown documents that get read by AI coding agents as instructions. When you run your AI coding tool in this directory, the agent reads these files and acts on them, including creating files, modifying code, and running commands.

**This is a supply chain risk.** A compromised prompt file can instruct an AI agent to exfiltrate data, install backdoors, or modify your code in harmful ways — all while appearing to do legitimate work.

## What these files are allowed to do

The role files (`agents/*.md`) and protocol files in this repo should **only**:

- Read files within this project directory
- Create/modify agent system files (CLAUDE.md, AGENTS.md, role files, memory files, protocol files)
- Run `git` commands scoped to this repo
- Run project dev tooling (tests, linters, build commands) as defined in project config
- Produce reports within the project directory

They should **never**:

- Read `.env`, credentials, SSH keys, API keys, or any secrets
- Make unsolicited network requests
- Access system paths outside this project directory (`/etc/`, `/home/`, `~/.ssh/`, etc.)
- Push to remotes, deploy, or execute deployment scripts without user confirmation
- Encode, obfuscate, or eval anything
- Suppress user review or bypass confirmation prompts
- Reference environment variables
- Include executable files or non-markdown content in `agents/`

## Before you use this

1. **Read every file in `agents/`** before running the agents.
2. **Verify the source.** Clone from the official repo. Check the commit history.
3. **Review changes to agent files.** When agent files are modified, read the diff before accepting.

## Reporting vulnerabilities

If you find a security issue — including prompt injection, data exfiltration instructions, or scope violations — please report it privately:

- Open a [GitHub Security Advisory](https://github.com/{org}/{repo}/security/advisories/new) on this repo
- Or email the maintainer directly (see GitHub profile)

Do not open a public issue for security vulnerabilities.
```

## When to Use

- Any agent repo that is public or may become public
- Repos where contributors (human or agent) submit PRs that modify agent files
- Repos where the agent system is shared across projects (like a forge)

## When to Skip

- Private repos with a single trusted user — the risk model is different when you control all inputs
- Projects where agent files are read-only and never modified by agents or contributors

## Adoption Status

| Project | Has SECURITY.md | Covers prompt risks | Reports channel |
|---------|-----------------|---------------------|-----------------|
| agent-forge | No | N/A | N/A |
| fab-trading-app | No | N/A | N/A |
| tcg-htc | **Yes** | **Yes** — explicit allow/deny lists for agent operations | GitHub Security Advisory + maintainer email |

*Last updated: 2026-04-08*
