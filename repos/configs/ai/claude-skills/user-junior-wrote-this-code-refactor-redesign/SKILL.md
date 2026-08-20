---
name: user-junior-wrote-this-code-refactor-redesign
description: Aggressively refactor and redesign the codebase as if a junior wrote it, grill every design decision, cut code amount, maximize readability, restructure for maintenance and extensibility, everything is an option. Use when the user wants a hard critical rewrite-level cleanup of test or non-test code. Keywords: junior code, aggressive refactor, redesign, grill, rewrite, restructure, cut code, shrink codebase, maintainability, extensibility, /user-junior-wrote-this-code-refactor-redesign.
argument-hint: "<test|nontest>"
arguments: [scope]
---

# Junior Wrote This: Refactor & Redesign

## Scope

Scope: `$scope`, required, one of:

- `nontest`: all non-test code. Test code is read-only context: never edit, move, delete, or rename a test file, fixture, or spec. If a redesign breaks tests, change the production design, then report which tests block it.
- `test`: all test code (test files, fixtures, specs, harnesses). Non-test code is read-only context: never edit production code, not one line, not to "unblock" a test redesign. Report blockers.

Any other value, or empty: stop and ask.

## Stance

Assume a junior wrote every line in scope. Trust nothing:

- Grill the design: every abstraction, layer, interface, dependency, and file split justifies its existence or goes.
- Everything is an option: merge modules, delete layers, invert dependencies, rewrite whole files, redraw package boundaries.
- Optimize, in order: less code, more readable code.
- Redesign for maintenance and extensibility: a newcomer extends the codebase without archaeology.

## Procedure

1. Survey: map the pieces in scope, how they connect, who calls what, where state lives, where duplication and dead weight sit.
2. Judge: list what is over-built, under-built, misplaced, duplicated, or dead. Rank by payoff.
3. Decide the target design: how the codebase should look, not how to patch it.
4. Plan the moves from current to target, ordered so build and tests stay green between steps.
5. Execute. Delete and rewrite over decorate.
6. Re-survey the result. Repeat until another pass would neither shrink nor clarify the code.

## Instructions

Apply all of:

- Cut code: delete dead code, collapse indirection, commonize duplication, replace hand-rolled mechanisms with the standard library.
- Maximize readability: names carry the meaning, flat over nested, one obvious way per task, hard-to-read code split into steps.
- Idiomatic, modern syntax of the target language.
- Restructure files and packages: related code together, one reason to change per piece.
- Public behavior identical unless the user approved a change: same inputs, outputs, side effects.

## Constraints

- Hard scope wall: `nontest` touches zero test code, `test` zero non-test code. No exceptions.
- Keep comment notation: label prefixes (`[where]`, `[why]`, `[what]`), `[>]`/`[<]` section markers, 🤖 marks. Add no new comments.
- Build, lint, full test suite after every plan step, green before the next.

## Bugs

Hit a bug: tell the user, let them decide. Non-interactive session: use best judgment, fix it, report what and why.

## Inconsistencies

Hit an inconsistency (inaccurate, contradictory, out of sync with the repo): tell the user, let them decide. Non-interactive session: resolve it with best judgment, keep the repo coherent, report what and why.
