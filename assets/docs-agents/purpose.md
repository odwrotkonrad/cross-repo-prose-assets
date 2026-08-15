# Purpose

## What It Is

Centralized prose for the whole workspace: repo conventions with runnable examples, per-repo purpose docs, README sources, specs, shared doc fragments, and the canonical ontoRepo doc templates, all in one semver-tagged repo. Downstream repos assemble their own docs from these artifacts via version-pinned che renderTemplates.

## Why It Exists

Prose lived scattered per repo: conventions in one repo, purpose docs, README prose, and specs in each consumer, duplicated templates everywhere. One canonical home makes every piece of prose authored, versioned, and released in one place, while each downstream keeps owning its assembly.

## Goals

- One canonical home for all workspace prose: conventions, per-repo prose under `repos/<repo-path>/`, shared fragments, templates.
- Every merge to main mints a semver tag: deletes/renames major, additions minor, edits patch, commit-token override.
- Each release triggers `control`, which propagates it to affected downstreams as regen MRs.
- Downstream owns assembly: prose ships artifacts, consumers render their own docs at a pinned version.
- Prose may pre-assemble: joining prose pieces into a downstream-ready artifact happens here, downstream still decides where it lands.
