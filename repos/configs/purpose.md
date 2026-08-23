# Purpose

## What It Is

Git-tracked dotfiles extended into root OS space: every option explicit, plus scripts and an observability stack. Che loads one `root/` tree onto the host: symlinked by default, `.ontoHost.cp` copied, `*.ontoHost.tpl` rendered. Repo docs and the license render from `cross-repo/prose/assets` at a pinned version. The AI toolchain lives apart, in `ai-harness/configs`, included at `AI_CONFIGS_REF`. Only the local `.env` seed renders from a repo-local template.

## Why It Exists

Records a system's stateful configuration for reading and reference, not for churn: explicit options, modifications separated from defaults, annotated choices.

## Goals

- Every configuration option explicit: defaults marked, modifications separated.
- One `root/` tree loads onto any supported host profile (desktop/macos, cli/macos, cli/linux).
- Generated docs stay fresh: tools inventory, Makefile doc, repo tree, agent files, README.
- No AI inside: the harness releases on its own cadence, behind `AI_CONFIGS_REF`.
