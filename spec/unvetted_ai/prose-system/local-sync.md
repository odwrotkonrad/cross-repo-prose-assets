# Feature: Local Sync of Generated Outputs

<!-- [>] 🤖🤖 -->

A local watcher keeps non-checked-out generated files fresh in local
worktrees: on a new prose tag it re-renders, per local repo checkout, only
outputs that are not tracked by git. Tracked files change exclusively through
the regen MR flow.

Scenario: a developer's local gitignored outputs follow prose releases
  Status: todo
  Given a local worktree whose render outputs include gitignored files
  When the watcher sees a new prose tag
  Then it re-renders those gitignored outputs in place

Scenario: the watcher never touches tracked files
  Status: todo
  Given a render output tracked by git
  When the watcher runs
  Then that file is left untouched
  And its updates arrive only via the regen MR flow

Scenario: a worktree without a prose pin is a clean no-op
  Status: todo
  Given a local repo checkout not pinning prose
  When the watcher runs
  Then it changes nothing and reports the repo as unpinned

<!-- [<] 🤖🤖 -->
