# Security Policy

## What this repo is

This repository contains **prompt files** — markdown documents that get read by AI coding agents as instructions. When you run `claude go` (or equivalent) in this directory, the agent reads these files and acts on them, including creating files, modifying code, and running commands in your projects.

**This is a supply chain risk.** A compromised prompt file can instruct an AI agent to exfiltrate data, install backdoors, or modify your code in harmful ways — all while appearing to do legitimate work.

## What these files are allowed to do

The role files (`agents/*.md`) and pattern files (`patterns/*.md`) in this repo should **only**:

- Read files within your registered projects and the forge directory
- Create/modify agent system files (CLAUDE.md, AGENTS.md, role files, memory files, protocol files, forums)
- Run `git` commands scoped to the forge's own repo (fetch tags, diff, checkout)
- Produce audit reports within `audits/`

They should **never**:

- Read `.env`, credentials, SSH keys, API keys, or any secrets
- Make network requests (curl, wget, fetch, etc.)
- Access system paths outside your project directories (`/etc/`, `/home/`, `~/.ssh/`, etc.)
- Push to remotes, deploy, or execute deployment scripts
- Encode, obfuscate, or eval anything
- Suppress user review or bypass confirmation prompts
- Reference environment variables
- Include executable files or non-markdown content in `agents/` or `patterns/`

## Before you use this

1. **Read every file in `agents/` and `patterns/`** before running the forge. These are the instructions your AI agent will follow.
2. **Verify the source.** Clone from the official repo. Check the commit history. Compare against a known-good tag.
3. **Pin to a tag.** Clone with `--branch v0.4` (or whichever version you've vetted). Don't track `main` blindly.
4. **Review upgrades.** When the forgemaster offers to apply upstream updates, read the diff before accepting.

## Reporting vulnerabilities

If you find a security issue in this repo — including prompt injection, data exfiltration instructions, or scope violations — please report it privately:

- Open a [GitHub Security Advisory](https://github.com/skondrashov/agent-forge/security/advisories/new) on this repo
- Or email the maintainer directly (see GitHub profile)

Do not open a public issue for security vulnerabilities.

## How this repo is maintained

- All changes to `agents/` and `patterns/` are reviewed before release
- An automated security scan checks every release for dangerous patterns (network requests, sensitive file access, encoding, system paths, confirmation bypasses)
- Tags are the release mechanism — `main` may contain unreleased work
- The repo is managed from a separate forge instance that keeps this directory pristine (no `.claude/` artifacts, no session state)
