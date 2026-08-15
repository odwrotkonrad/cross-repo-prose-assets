# Feature: Cross-Repo Interface Declarations

<!-- [>] 🤖🤖 -->

Each repo declares its own cross-repo surface in
`.repo/cross-repo-interface.yml`: `upstream:` lists the `<repo>/<artifact>`
vertices it consumes repo-level, `edges:` maps an upstream vertex to the list
of this repo's artifacts it lands in, `downstream:` lists the artifacts it
produces (`name` + `type`). Control aggregates all declarations into one
generated dependency graph; no central file is hand-maintained.

Scenario: a repo owner declares that repo's dependencies where they live
  Status: implemented
  Given a repo producing or consuming cross-repo artifacts
  When its interface changes
  Then only its own `.repo/cross-repo-interface.yml` is edited

Scenario: the whole workspace graph stays derivable from per-repo declarations
  Status: implemented
  Given every repo's interface file plus bootstrap seed entries for repos not yet declaring
  When control aggregates
  Then it renders one generated `deps-graph.yml` merging declarations over seeds
  And the generated file is committed for readability, never hand-edited

Scenario: a dangling consumption is an error, not silent drift
  Status: implemented
  Given an `upstream:` entry naming an artifact no repo produces
  When aggregation runs
  Then it fails naming the consumer and the missing artifact

Scenario: bootstrap seeds shrink as repos start declaring
  Status: implemented
  Given a repo adds its own `.repo/cross-repo-interface.yml`
  When its seed entry is removed
  Then aggregation output stays unchanged for that repo

<!-- [<] 🤖🤖 -->
