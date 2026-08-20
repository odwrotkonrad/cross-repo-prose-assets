---
name: user-prettify-code
description: Refactor code for quality without changing behavior, reduce complexity, remove antipatterns, idiomatic target-language code, modern syntax, commonize repeated code, remove dead code. Use when the user wants code cleaned up, simplified, modernized, deduplicated, or de-antipatterned. Keywords: prettify, refactor, clean up, simplify, dedupe, modernize, idiomatic, antipattern, dead code, /user-prettify-code.
argument-hint: "[all-repo|uncommited-changes|diff-from-main|<path>] [lang]"
arguments: [scope, lang]
allowed-tools: "Bash(${CLAUDE_SKILL_DIR}/scripts/*)"
---

# Prettify Code

## Target

Scope: `$scope` (empty → `diff-from-main`). Resolved target files:

!`${CLAUDE_SKILL_DIR}/scripts/resolve-scope.sh $scope`

Code files only: skip docs, data, lockfiles, generated files, content-unchanged renames.

## Language Principles

Lang: `$lang` (empty → none). When set, apply these design principles to every target in that language:

!`${CLAUDE_SKILL_DIR}/scripts/print-lang-principles.sh $lang`

## Procedure

Top-down, recursive:

1. Look at the targets from high level: file structure, module boundaries, how pieces relate.
2. Plan: what to restructure, what to touch per file, in what order.
3. Execute.
4. Repeat on smaller pieces (a file, a function cluster) as needed.

## Instructions

Apply all of:

- Reduce complexity. Flatten nesting, split hard-to-read code into steps, drop needless indirection.
- Remove antipatterns.
- Idiomatic. What a fluent practitioner of the language would write: standard library over hand-rolled, native constructs and conventions.
- Modern, concise syntax of the runtime.
- Commonize. Repeated code becomes one shared function, constant, or structure.
- Remove dead code: unused functions, variables, imports, branches, commented-out code.

## Constraints

Preserve behavior: same inputs, outputs, side effects. Never trade correctness for elegance.

Keep comment notation: label prefixes (`[where]`, `[why]`, `[what]`), `[>]`/`[<]` section markers, 🤖 marks. Add no new comments.

Run the tests covering a target after changing it.

## Bugs

Hit a bug: tell the user, let them decide. Non-interactive session: use best judgment, fix it, report what and why.

## Inconsistencies

Hit an inconsistency (inaccurate, contradictory, out of sync with the repo): tell the user, let them decide. Non-interactive session: resolve it with best judgment, keep the repo coherent, report what and why.
