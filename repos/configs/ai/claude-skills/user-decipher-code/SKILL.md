---
name: user-decipher-code
description: Make code self-descriptive, understand every symbol and comment, then fold clarifying comments into names and structure, rename, rearrange, cut comments, until reading the code is a pleasure. Use when the user wants code deciphered, made self-explanatory, comments reduced, or symbols renamed for clarity. Keywords: decipher, self-descriptive, self-documenting, rename symbols, reduce comments, clarify code, readable, /user-decipher-code.
argument-hint: "[all-repo|uncommited-changes|diff-from-main|<path>] [lang]"
arguments: [scope, lang]
allowed-tools: "Bash(${CLAUDE_SKILL_DIR}/scripts/*)"
---

# Decipher Code

## Target

Scope: `$scope` (empty → `diff-from-main`). Resolved target files:

!`${CLAUDE_SKILL_DIR}/scripts/resolve-scope.sh $scope`

Code files only: skip docs, data, lockfiles, generated files, content-unchanged renames.

## Language Principles

Lang: `$lang` (empty → none). When set, apply these design principles to every target in that language:

!`${CLAUDE_SKILL_DIR}/scripts/print-lang-principles.sh $lang`

## Procedure

1. Read the targets whole. Understand every symbol and comment. Each clarifying comment marks a spot where the code failed to speak for itself.
2. Fold that understanding into the code:
   - Rename. Each name carries what the comment had to explain: max info, `noun_noun_verb`, max 3 parts.
   - Standard names over coined ones (`src`/`dst`, `count`, `path`, `parse`, `render`). Replace every coined term with its standard equivalent wherever it appears. One word per concept across all symbols, no synonyms.
   - Rearrange. Top-down order: intent first, detail below, related things adjacent.
   - Cut comments. Once a name or structure says it, delete the comment. Keep only what code cannot express.
3. Re-read as a first-time reader. Any spot that needs a comment or a pause: rename or rearrange again.

Goal: every piece understood from its name and position alone.

## Constraints

Preserve behavior: same inputs, outputs, side effects.

Surviving comments keep their notation: label prefixes (`[where]`, `[why]`, `[what]`), `[>]`/`[<]` section markers, 🤖 marks. Add no new comments.

Run the tests covering a target after changing it.

## Bugs

Hit a bug: tell the user, let them decide. Non-interactive session: use best judgment, fix it, report what and why.

## Inconsistencies

Hit an inconsistency (inaccurate, contradictory, out of sync with the repo): tell the user, let them decide. Non-interactive session: resolve it with best judgment, keep the repo coherent, report what and why.
