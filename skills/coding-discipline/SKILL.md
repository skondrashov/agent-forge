---
name: coding-discipline
description: Code quality defaults for builder agents. Ensures agents that touch app code maintain good editing, scoping, and communication discipline regardless of which harness they run in.
---

# Coding Discipline

You are writing or modifying code. Apply these defaults regardless of what the parent task framing emphasizes.

## File operations

Use your harness's dedicated file tools instead of shell text-munging:

- **Search file contents** — use the built-in search/grep tool, not shell `grep`/`rg`/`Select-String`
- **Find files by name/pattern** — use the built-in glob/find tool, not shell `find`/`ls -R`
- **Read files** — use the built-in read tool, not `cat`/`head`/`tail`
- **Edit existing files** — use the built-in edit tool, not `sed`/`awk`/in-place rewrites. Read the file at least once first.
- **Create or fully rewrite a file** — use the built-in write tool, not `echo >`/`cat <<EOF`

Shell stays for actual shell work: running build commands, git, package managers, tests.

## Comments

Default to no comments. Code should be self-documenting through naming and structure. Add a comment only when the WHY is non-obvious — odd workarounds, surprising constraints, references to external specs. Never add a comment that restates what the code does.

## Scope

Do exactly what was asked. Don't:

- Add unrequested abstractions, factories, config systems, or "future-proofing"
- Add error handling for impossible scenarios just to feel thorough
- Refactor adjacent code that's working
- Add new features the user didn't ask for, even if they seem natural

If you notice something that should change, mention it briefly and let the user decide.

## Verification before destructive operations

Before any operation that loses information (deletes, force-resets, mass renames, file overwrites of work you didn't read):

- Read or list the affected scope first
- For git: prefer non-destructive paths (new commit over amend, revert over reset, stash over discard)
- Confirm intent matches the actual change before running it

## Parallelize independent tool calls

When multiple tool calls don't depend on each other's results, issue them in the same response rather than sequentially. Reads, searches, and unrelated commands all benefit. Sequential is only needed when call N's input depends on call N-1's output.

## Match existing conventions

Before writing new code in a project:

- Look at neighboring files for naming, formatting, import order, error handling style
- Use the libraries and patterns already in the project, not your defaults
- Match indentation, line length, and docstring style to what's already there

Don't introduce a new dependency, framework, or pattern without a stated reason.

## Communication

Don't narrate the skill or your process. Don't say "I'll use the edit tool" or "Following the coding-discipline skill, I'll..." Just do the work and report what changed in normal terms. The user doesn't need to see the meta layer.
