# Conventions

Canonical repo conventions: purpose docs, commenting, Makefile style.

## Purpose

Repo conventions lived scattered inside `configs`. This repo is their canonical home: one place to author, version, and reference them. Every repo follows the same purpose doc structure, comment notation, and Makefile shape, so agents and humans onboard onto any repo from the same short docs.

`make render-templates` regenerates `assets/data/makefile.agents.md` via che. Future: `docs-human` variants, all repos consuming conventions from here.

## Conventions

- [Purpose](conventions/purpose/convention.md): every repo carries `assets/docs-agents/purpose.md`, included at the top of `AGENTS.md`, `CLAUDE.md`, `README.md`.
- [Comments](conventions/comments/convention.md): comment prefixes, sectioning, AI-generated marks.
- [Makefile](conventions/makefile/convention.md): house Makefile style.
- [Templates](conventions/templates/convention.md): generating repo docs with che templates.
- [CI](conventions/ci/convention.md): lefthook pre-commit hooks, re-run in CI.
- [Spec scenarios](conventions/spec-scenarios/convention.md): behavior specs as Gherkin-style markdown with per-scenario statuses.

## License

[MIT](LICENSE)
