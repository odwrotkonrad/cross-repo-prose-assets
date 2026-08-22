# go-modules

@assets/docs-agents/purpose.md

This repo's behavior specs live in the spec repo (`cross-repo/prose/spec`): `repos/go-modules/spec/` (`.story.md` user stories by default, `.scenarios.md` Gherkin only for automation-bound behavior, status in each title, vetting dirs apply, edit specs before implementation).

# Modules

Each module has its own `go.mod` (`gitlab.com/konradodwrot/go-modules/<module>`) and release stream: dir-prefixed tags `<module>/vX.Y.Z`, bumped by CI on default-branch pushes touching the module dir. Root `go.work` ties the modules together for local dev.

## che

@che/assets/docs-agents/purpose.md

## get-os-open-files-with

@get-os-open-files-with/assets/docs-agents/purpose.md

## get-term-open-files-with

@get-term-open-files-with/assets/docs-agents/purpose.md

## lib

@lib/assets/docs-agents/purpose.md

@assets/data/makefile.agents.md

## Directory Tree

@assets/data/repo-structure.md
