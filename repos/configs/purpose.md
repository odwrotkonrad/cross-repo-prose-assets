# Purpose

## What It Is

Git-tracked dotfiles extended into root OS space: every option explicit, plus scripts and an observability stack. Che loads one `root/` tree onto the host: symlinked by default, `.ontoHost.cp` copied, `*.ontoHost.tpl` rendered. Repo docs, the license, and the AI prose payloads (agent rules, skills, output styles, snippets) render from the prose repo at a pinned version. Only the local `.env` seed renders from a repo-local template.

## Why It Exists

Records a system's stateful configuration for reading and later reference, not for frequent software updates. Explicit configuration, modifications separated from defaults, annotated choices.

## Goals

- Every configuration option explicit: defaults marked, modifications separated.
- One `root/` tree loads onto any supported host profile (desktop/macos, cli/macos, cli/linux).
- Generated docs stay fresh: tools inventory, Makefile doc, repo tree, agent files, README.

