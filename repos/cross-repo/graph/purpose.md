# Purpose

## What It Is

The workspace dependency graph, as data. Three YAML files written by `cross-repo/automation`: `bare-system-graph.yml` (every artifact and dependency, no versions), `desired-system-graph.yml` (the version each upstream should be) and `current-system-graph.yml` (the version each upstream is). Convergence is `desired == current`, readable at a glance.

## Why It Exists

The graph describes every repo in the group, so its commit log is the history of the system: what version moved where, and when. Kept beside the generator, that record is interleaved with refactors and test changes and stops being readable. Here `git log` is one commit per system change and nothing else.

## Goals

- Data only: no Ruby, no build, no release, no tags. One CI job, the shared `EmitEvents`.
- Written by automation alone: a hand edit is drift, and the next regeneration overwrites it.
- Same `artifacts:` + `depends_on:` syntax the repos use, so one parser and one mental model serve both.
- Fully regenerable: delete all three files and one aggregation pass restores them byte-identically.
- Read at `main`, never at a pin: the graph is state, and a stale pin would mean acting on a stale picture of the system.
