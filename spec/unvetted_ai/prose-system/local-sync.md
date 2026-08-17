# Feature: Local Sync of Generated Outputs

<!-- [>] 🤖🤖 -->

A local watcher keeps generated files fresh in local worktrees. On a new prose
tag it re-renders, per checkout, only outputs git does not track. Tracked files
change through the regen MR flow alone.

Scenario: a developer's local gitignored outputs follow prose releases
  Status: implemented
  Given a local worktree whose render outputs include gitignored files
  When the watcher sees a new prose tag
  Then it re-renders those gitignored outputs in place

Scenario: the watcher never touches tracked files
  Status: implemented
  Given a render output tracked by git
  When the watcher runs
  Then that file is left untouched
  And its updates arrive only via the regen MR flow

Scenario: a worktree without a prose pin is a clean no-op
  Status: implemented
  Given a local repo checkout not pinning prose
  When the watcher runs
  Then it changes nothing and reports the repo as unpinned

<!-- [<] 🤖🤖 -->
