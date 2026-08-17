# Purpose

## What It Is

Spec-driven dotfile configuration loader: detects OS+arch+virt, resolves a profile from `che.yml`, loads that profile's files, dirs, installs, services. Renders `*.tpl` templates, each dest path deciding the target (relative: repo, `~/` or absolute: host), resolving op:// (1Password) and gcp:// (GCP Secret Manager) secret refs at render time. The `render/` package tree carries the shared gomplate render engine, exposed as `che render` subcommands: `tpl` (gomplate built-ins, op:// and gcp:// secrets, `remoteFile` cross-repo inclusion, frontmatter, markdown transforms), `makefile-doc` (`[genai-include]` Makefile docs), `dirs-tree` (tracked-file directory trees), `repo-group-index` (subgroup repo indexes), `checkcmd` (`--check` drift helper).

## Why It Exists

Shell-script dotfile loading is fragile, imperative, host-specific. One declarative spec drives every host instead. The render engine lives here because che is its only consumer, so che and repo docs generation share one implementation.

## Goals

- Idempotent host loading: symlink, copy, render, prune, verify.
- `*.ontoRepo.tpl` rendering keeps agent files and README fresh.
- Releases ship one `che` binary. The render engine is a subcommand tree, not separate binaries.
