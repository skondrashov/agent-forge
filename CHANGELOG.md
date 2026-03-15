# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/).
This project uses 0.x versioning.

## [Unreleased]

### Added

- Challenge loop pattern for skeptic/strategist review cycles
- First-run wizard for blank-slate project setup
- `.gitignore` for tool-specific config directories

### Changed

- Moved first-run wizard from tool-specific skill to `patterns/first-run.md`
- Moved activation instructions from AGENTS.md into forgemaster role file
- Streamlined protocol pattern

## [0.1] - 2026-03-14

### Added

- Initial public template with audit-and-propagate loop
- Forgemaster, assayer, smith, keeper agent roles
- Pattern library: steward, protocol, reflection, ref-docs, feedback
- Cross-project service steward variant
- Harness-agnostic design (no tool-specific branding)
- Self-upgrade mechanism via upstream tag checking
- README with quickstart and structure docs

[Unreleased]: https://github.com/skondrashov/agent-forge/compare/v0.1...HEAD
[0.1]: https://github.com/skondrashov/agent-forge/releases/tag/v0.1
