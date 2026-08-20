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
