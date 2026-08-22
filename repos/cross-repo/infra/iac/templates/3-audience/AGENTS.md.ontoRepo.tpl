# iac

The `konradodwrot` group tree and the identities it holds, as Terraform.

@assets/docs-agents/purpose.md

## Specs Before Implementation

This repo's behavior specs live in the spec repo (`cross-repo/prose/spec`): `repos/cross-repo/infra/iac/spec/`. Two forms sharing a stem: `<feature>.story.md`
user stories by default, `<feature>.scenarios.md` Gherkin only for
automation-bound behavior. Functionality added / modified / removed → edit
those specs FIRST, then implement, then set each touched status. Status closes
the title in parentheses: `### <story title> (todo)`, `Scenario: <title>
(implemented)`. New: `(todo)`. Removed: delete the story, same change. Never
implement unspecced.

Vetting dirs bound edits: `vetted/` never touch; `vetted_title_only/` story
titles and `Scenario:` lines frozen, rest editable, the trailing status stays
accurate; `unvetted_ai/` free rein, all new AI specs land here. Moving files,
stories and scenarios between dirs must come from human will.
`technical-requirements.md` same dirs, prefer `vetted/`: on add/change urge
the human to vet first.

@assets/data/makefile.agents.md

## Directory Tree

@assets/data/repo-structure.md
