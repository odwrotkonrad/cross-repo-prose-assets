# Purpose

## What It Is

Git-tracked dotfiles extended into root OS space: every option explicitly configured, scripts, observability stack. Loaded onto the host from one `root/` tree by che: symlinked by default, `.ontoHost.cp` copied, `*.ontoHost.tpl` rendered onto the host. Repo docs, the license, and the AI prose payloads (agent rules, skills, output styles, snippets) render from the prose repo at a pinned version; only vm vars and repo-specific templates render from local sources.

## Why It Exists

Records a system's stateful configuration for reading and future reference, not frequent software updates: explicit configuration, modified settings separated from defaults, annotated choices.

## Goals

- Every configuration option explicit: defaults marked, modifications separated.
- One `root/` tree loads onto any supported host profile (desktop/macos, cli/macos, cli/linux).
- Generated docs stay fresh: tools inventory, Makefile doc, repo tree, agent files, README.

