# Prose

Centralized prose: conventions, purpose docs, README sources, specs, shared doc templates.

## Purpose

Prose lived scattered per repo. This repo is its canonical, semver-tagged home. Downstream repos own assembly: their che renderTemplates consume these artifacts at a pinned version.

Every merge to main mints the next `vX.Y.Z` tag (`ci/semver-bump.zsh`: deletes/renames major, additions minor, else patch, `semver: <bump>` commit token overrides). A tag pipeline triggers the [control](https://gitlab.com/konradodwrot/control) repo, which propagates the release to affected downstreams as regen MRs.

`make render-templates` regenerates this repo's own docs via che. Prose also joins pieces into combined artifacts, downstream still decides where they land.

## Layout

- `conventions/`: repo conventions, each `<name>/convention.md` plus a runnable `example/`.
- `repos/<repo-path>/`: per-repo prose (`purpose.md`, `readme/`, `spec/`, `docs/`), mirroring the GitLab group tree.
- `shared/`: doc fragments consumed by more than one repo.
- `templates/`: canonical ontoRepo templates downstream repos source.
- `spec/`: this system's behavior specs (Gherkin markdown, per-scenario statuses).
- `ci/`: semver bump inference and tag minting.

## License

[MIT](LICENSE)
