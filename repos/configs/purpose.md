# Purpose

## What It Is

Git-tracked dotfiles extended into root OS space: every option explicit, plus scripts and an observability stack. Che loads one `root/` tree onto the host: symlinked by default, `.ontoHost.cp` copied, `*.ontoHost.tpl` rendered. Repo docs, the license, and the AI prose payloads (agent rules, skills, output styles, snippets) render from `cross-repo/prose/assets` at a pinned version, the workspace conventions summary from `cross-repo/prose/spec` at `PROSE_SPEC_REF`. Only the local `.env` seed renders from a repo-local template.

## Why It Exists

Records a system's stateful configuration for reading and reference, not for churn: explicit options, modifications separated from defaults, annotated choices.

## Goals

- Every configuration option explicit: defaults marked, modifications separated.
- One `root/` tree loads onto any supported host profile (desktop/macos, cli/macos, cli/linux).
- Generated docs stay fresh: tools inventory, Makefile doc, repo tree, agent files, README.
- Sole consumer of `cross-repo/prose/spec`: the conventions summary loads once, onto the host, beside the other agent prose.
