# Purpose

## What It Is

Cross-repo automation hub, one Ruby CLI (`bin/automation`). Takes one JSON event per CI trigger (`release.published` from a producer's tag pipeline, `ci-var.changed` from iac's main apply), owns the dependency graph aggregated from per-repo `.repo/cross-repo-interface.yml` declarations, regenerates affected downstreams as deterministic bot MRs (auto-merge on patch/minor, human review on major), and runs a local watcher keeping non-checked-out rendered outputs fresh in local worktrees.

## Why It Exists

Centralized prose needs an operator: notice a release, know who consumes it, carry the update into every affected repo. The dependency graph was hand-maintained in one spec file. Now each repo declares its interface and automation derives the graph, so the map cannot drift from the territory.

## Goals

- A producer release pins iac, iac's apply reports the variables it moved, each moved variable regenerates its consumers at the applied value. No polling.
- Dependency graph generated, never hand-edited: per-repo declarations merged over bootstrap seeds, inconsistency fails the build.
- Bot MRs deterministic and safe: fixed text template, auto-merge only patch/minor on green downstream CI.
- Local sync: the watcher re-renders only gitignored outputs, tracked files change via MRs only.
- Workspace assembly lives here: the `workspace/` che profile clones the group tree, links parent Makefiles and the VS Code workspace file, generates the non-checked-out repo indexes.
