# Purpose

## What It Is

One semver-tagged repo holding the prose rendered into every workspace repo: per-repo purpose docs, README sources, AI payloads (agent rules, skills, output styles, snippets), shared fragments, the canonical license, the ontoRepo doc templates. Downstream repos assemble their own docs from these artifacts via version-pinned che renderTemplates.

## Why It Exists

Prose lived scattered: purpose docs, README prose and templates duplicated in each consumer. One home means every rendered piece is authored, versioned and released in one place, while each downstream still owns its assembly. Conventions and specs live apart, in `cross-repo/prose/spec`, so a contract edit never re-renders a README.

## Goals

- One canonical home for rendered prose: per-repo prose under `repos/<repo-path>/`, shared fragments, templates.
- `repos/<repo-path>/` mirrors the GitLab group tree: the path under `repos/` equals the project path.
- Every merge to main mints a semver tag, patch by default. A `semver: major|minor|patch` commit token lifts it.
- Each release triggers `cross-repo/automation`, which propagates it to affected downstreams as regen MRs.
- Downstream owns assembly: assets ships artifacts, consumers render their own docs at a pinned version.
