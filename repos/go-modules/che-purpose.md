# Purpose

## What It Is

Spec-driven dotfile loader: detects OS, arch and virt, resolves a profile from `che.yml`, loads its files, dirs, installs and services. Renders `*.tpl` templates, the dest path picking the target (relative: repo, `~/` or absolute: host), with op:// (1Password) and gcp:// (GCP Secret Manager) refs resolved at render time. The `render/` package tree is the shared gomplate engine, exposed as `che render` subcommands: `tpl` (gomplate built-ins, op:// and gcp:// secrets, `remoteFile` cross-repo inclusion, frontmatter, markdown transforms), `makefile-doc` (`[genai-include]` Makefile docs), `dirs-tree` (tracked-file directory trees), `repo-group-index` (subgroup repo indexes), `checkcmd` (`--check` drift helper).

## Why It Exists

Shell-script dotfile loading is fragile, imperative, host-specific. One declarative spec drives every host. The render engine lives here because che is its only consumer: host loading and repo docs generation share one implementation.

## Goals

- Idempotent host loading: symlink, copy, render, prune, verify.
- `*.ontoRepo.tpl` rendering keeps agent files and README fresh.
- One `che` binary per release. The render engine is a subcommand tree, not separate binaries.
