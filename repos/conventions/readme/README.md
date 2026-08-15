# Conventions

Retired. Repo conventions live in [prose](https://gitlab.com/konradodwrot/prose) under `conventions/`.

## Purpose

Held the workspace conventions before prose centralized all workspace prose. Nothing is authored here anymore. Content moved to `prose/conventions/`, versioned there, consumed by downstream repos at pinned versions (`@gitlab.com/konradodwrot/prose//<path>?ref=vX.Y.Z`).

This repo stays until every consumer is verified against prose, then archived or deleted.

## Conventions

All in `prose/conventions/`, each with a runnable `example/`:

- `purpose/convention.md`: every repo's purpose doc (what, why, goals), authored in prose, rendered into the repo, included at the top of `AGENTS.md`, `CLAUDE.md`, `README.md`.
- `comments/convention.md`: comment label prefixes, sectioning, AI-generated marks.
- `makefile/convention.md`: house Makefile style, sectioning that feeds the generated Makefile doc.
- `templates/convention.md`: repo docs generated with che templates pinned to a prose version.
- `ci/convention.md`: lefthook pre-commit hooks, re-run in CI.
- `license/convention.md`: every public repo carries an unmodified MIT `LICENSE`, rendered from prose.
- `spec-scenarios/convention.md`: behavior specs as Gherkin-style markdown with per-scenario statuses and vetting dirs.
- `claude-agents/convention.md`: per-repo claude agents, che-rendered into `.claude/` on virt only.

## License

[MIT](LICENSE)
