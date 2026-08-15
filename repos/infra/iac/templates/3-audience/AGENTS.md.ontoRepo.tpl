# infra

The `restricted` group and the sandbox identity it holds, as Terraform.

@assets/docs-agents/purpose.md

@assets/data/conventions.md

## Specs Before Implementation

This repo's behavior specs live in the prose repo:
`prose/repos/infra/iac/spec/`. Functionality added / modified / removed →
edit those scenarios FIRST, then implement, then set each touched `Status:`.
New: `Status: todo`. Removed: delete the scenario, same change. Never
implement unspecced.

Vetting dirs bound edits: `vetted/` never touch; `vetted_title_only/` titles
frozen, rest editable; `unvetted_ai/` free rein, all new AI scenarios land
here. Moving files and scenarios between dirs must come from human will.
`technical-requirements.md` same dirs, prefer `vetted/`: on add/change urge
the human to vet first.

@assets/data/makefile.agents.md

## Directory Tree

@assets/data/repo-structure.md
