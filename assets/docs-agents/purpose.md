# Purpose

## What It Is

One semver-tagged repo holding all workspace prose: conventions with runnable examples, per-repo purpose docs, README sources, specs, shared fragments, canonical ontoRepo doc templates. Downstream repos assemble their own docs from these artifacts via version-pinned che renderTemplates.

## Why It Exists

Prose lived scattered: conventions in one repo, purpose docs, README prose and specs in each consumer, templates duplicated everywhere. One home means every piece is authored, versioned and released in one place, while each downstream still owns its assembly.

## Goals

- One canonical home for all workspace prose: conventions, per-repo prose under `repos/<repo-path>/`, shared fragments, templates.
- Every merge to main mints a semver tag, patch by default. A `semver: major|minor|patch` commit token lifts it.
- Each release triggers `control`, which propagates it to affected downstreams as regen MRs.
- Downstream owns assembly: prose ships artifacts, consumers render their own docs at a pinned version.
- Prose may pre-assemble: pieces join into a downstream-ready artifact here, downstream still decides where it lands.
