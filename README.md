# Prose

Centralized prose: conventions, purpose docs, README sources, specs, shared doc templates.

## Purpose

Prose used to live scattered across repos. This is its one semver-tagged home. Downstream repos own assembly: their che renderTemplates pull these artifacts at a pinned version.

Every merge to main mints the next `vX.Y.Z` tag. `ci/semver-bump.zsh` bumps the patch: prose grows by adding files, so an add is not a release event. A `semver: major|minor|patch` commit token lifts it above patch. The tag pipeline triggers [control](https://gitlab.com/konradodwrot/control), which propagates the release to affected downstreams as regen MRs.

`make render-templates` regenerates this repo's own docs via che. Prose may also join pieces into a combined artifact. Downstream still decides where it lands.

## Layout

- `conventions/`: repo conventions, each a `<name>/convention.md` plus a runnable `example/`.
- `repos/<repo-path>/`: per-repo prose (`purpose.md`, `readme/`, `spec/`, `docs/`), mirroring the GitLab group tree.
- `shared/`: doc fragments more than one repo consumes.
- `templates/`: canonical ontoRepo templates downstream repos source.
- `spec/`: this system's own behavior specs (Gherkin markdown, per-scenario statuses).
- `ci/`: semver bump inference and tag minting.

## License

[MIT](LICENSE)
