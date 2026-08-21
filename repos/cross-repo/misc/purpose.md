# Purpose

## What It Is

Shared CI scripts every workspace repo renders into its checkout: `ci/semver-bump.zsh` infers the next semver tag from the last tag's diff, `ci/tag-mint.zsh` mints and pushes it. Shared CI templates sit beside them, included at `MISC_REF`: `ci/templates/TriggerAutomation.gitlab-ci.yml`, the one job that sends `cross-repo/automation` an event.

## Why It Exists

One copy of the tagging logic, rendered untracked into each consumer at a pinned version, instead of a script per repo. Scripts change for reasons of their own, so they release apart from prose.

## Goals

- One home for shared CI scripts and templates, consumed through che renderTemplates at `MISC_REF`.
- Every merge to main mints a semver tag. Each release triggers `cross-repo/automation`, which re-renders the scripts into affected repos.
- This repo runs its own scripts from source: nothing here is rendered from itself.
