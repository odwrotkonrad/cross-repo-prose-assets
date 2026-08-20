# Prose

Centralized prose: conventions, purpose docs, README sources, specs, shared doc templates.

## Purpose

One semver-tagged home for prose that used to live scattered across repos. Downstream repos own assembly: their che renderTemplates pull these artifacts at a pinned version.

Every merge to main mints the next `vX.Y.Z` tag. `ci/semver-bump.zsh` bumps the patch by default: prose grows by adding files, and an add is not a release event. A `semver: major|minor|patch` commit token lifts it. The tag pipeline triggers [control](https://gitlab.com/konradodwrot/control), which fans the release out to affected downstreams as regen MRs.

`make render-templates` regenerates this repo's own docs via che. Prose may pre-assemble pieces into one artifact. Downstream still decides where it lands.

## Layout

- `conventions/`: repo conventions, each a `<name>/convention.md` plus a runnable `example/`.
- `repos/<repo-path>/`: per-repo prose (`purpose.md`, `readme/`, `spec/`, `docs/`), mirroring the GitLab group tree.
- `shared/`: doc fragments more than one repo consumes.
- `templates/`: canonical ontoRepo templates downstream repos source.
- `spec/`: this system's own behavior specs (Gherkin markdown, per-scenario statuses).
- `ci/`: semver bump inference and tag minting.

## License

[MIT](LICENSE)
