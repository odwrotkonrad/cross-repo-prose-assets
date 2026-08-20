# Prose Spec

Conventions and behavior specs every workspace repo obeys.

{{ renderMarkdown "assets/docs-agents/purpose.md" "normalize-headings" }}

## Release

Every merge to main mints the next `vX.Y.Z` tag, patch by default, lifted by a `semver: major|minor|patch` commit token. The tag pipeline triggers [automation](https://gitlab.com/konradodwrot/cross-repo/automation), which re-renders `conventions/conventions.md` into affected repos as regen MRs. Consumers pin this repo through `PROSE_SPEC_REF` (`GRP_KO_VAR_PROSE_SPEC_REF`).

Rendered prose (purpose docs, templates, AI payloads, license) lives in [assets](https://gitlab.com/konradodwrot/cross-repo/prose/assets), shared CI scripts in [misc](https://gitlab.com/konradodwrot/cross-repo/misc).

## Layout

- `conventions/`: repo conventions, each a `<name>/convention.md` plus a runnable `example/`. `conventions.md` summarizes them, one line each.
- `repos/<repo-path>/spec/`: per-repo behavior specs, mirroring the GitLab group tree. `repos/shared/spec/`: behavior every repo shares.

## License

[MIT](LICENSE)
