# Purpose

## What It Is

Cross-repo automation hub, one Ruby CLI (`bin/automation`). Takes a JSON array of events per CI trigger (`artifact.released`, `ci-variable.updated`, `artifacts.declared|consumed|produced`), aggregates every repo's `.repo/` declarations into the three system graphs it writes to `cross-repo/graph`, generates `cross-repo/infra/ci-variables`' tfvars, and regenerates affected downstreams as deterministic bot MRs (auto-merge on patch/minor, human review on major).

## Why It Exists

Centralized prose needs an operator: notice a release, know who consumes it, carry the update into every affected repo. The graph was hand-maintained, then hand-shaped; now every artifact and edge comes from the repos' own declarations, so the map cannot drift from the territory. The graph lives in its own repo because its commit log is the history of the system, unreadable if mixed with this code.

## Goals

- A producer release raises its variables, each moved variable regenerates its consumers at the applied value. No polling.
- Propagation scoped by `depends_on`: an upstream rebuilds exactly the artifacts declaring it, and one nothing is built from is recorded and nothing more.
- Graph generated, never hand-edited: delete all three files and one aggregation pass restores them byte-identically.
- Publishing a version cannot retrigger a release: `artifacts.produced` records and fans out nothing.
- Bot MRs deterministic and safe: fixed text template, auto-merge only patch/minor on green downstream CI.
- Workspace assembly lives here: the `workspace/` che profile clones the group tree, links parent Makefiles and the VS Code workspace file, generates the non-checked-out repo indexes.
