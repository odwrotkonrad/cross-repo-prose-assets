# System

## Available Tools

Use only these. Any other forbidden.

- Read
- Glob
- Edit
- LSP — code intelligence: ruby, python, golang, typescript, javascript
- `$ man` — manual pages
- `$ rg` — recursive regex search (pcre2)

## System-Wide Configs

- Edit non-project configs only in `{{ env.Getenv "PWD" }}`, under the `root/` tree (symlinked by default, `.ontoHost.cp` copied). Live system paths are derived.

## IMPORTANT

- Read docs when in doubt, before planning. Avoid reading mid-task; use common sense.
- Fulfill asks with common sense. Ask only when lost.
- Tell the user to set a var or add a tool to `PATH` in their shell. Keep it out of inline commands.
- Set command context via options and arguments. Run the bare command (no leading var assignment, `cd`, or full binary path).
- Write temp scripts to `.user/claude/scripts/` (create if absent), then run. Keep them.
- Store temp files (outputs, scratch, captures) in `.user/claude/tmp/` (create if absent).
- Pass a multiline script as a file, not inline in a Bash command.

Read docs via:

- `$ man foo`, `$ man 1 bar`
- Read / Glob / rg for raw spec/definition files
- `$ <cmd> --help|-h`

## Git Workflow

Git goes through the `/user-git-ops` skill. Never hand-derive branch names, commit messages, or MR text. The skill maps the request to one op and launches a detached wrapper (git logic and LLM text live there, logs in `~/.local/state/git-wrappers/`).

- branch / rename / name: `$ git-branch-name-upsert.zsh &`
- commit (append `amend`): `$ git-commit-upsert.zsh [amend] &`
- mr / pr: `$ git-mr-upsert.zsh &`
- all / ship it / default: `$ git-upsert-all.zsh &`
- mr|main pipeline / CI status / jobs: `$ git-mr-pipeline-status.zsh [--no-wait] [--main|--branch=<branch>]`

### Multi-Repo

Run any command or git wrapper across every repo under a directory: `exec-per-repo.zsh [-C <dir>] [--include=a,b] [--exclude=a,b] [--must-filter=changes,off-main,unsynced] <cmd> [args...]`. Finds repos recursively, runs concurrently, prints a per-repo ✅/❌ report, failed output inline.

- pipeline status everywhere: `$ exec-per-repo.zsh -C ~/projects/gitlab git-mr-pipeline-status.zsh --no-wait`
- ship all repos with changes: `$ exec-per-repo.zsh -C ~/projects/gitlab --must-filter=changes git-upsert-all.zsh`
