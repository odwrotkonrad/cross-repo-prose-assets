# Feature: Cross-Repo Interface Declarations

<!-- [>] 🤖🤖 -->

Each repo declares its own cross-repo surface in
`.repo/cross-repo-interface.yml`: `downstream:` lists the artifacts it
produces (`name` + `type`), `upstream:` lists the `<repo>/<artifact>` vertices
it consumes. Control aggregates all declarations into one generated
dependency graph; no central file is hand-maintained.

Scenario: a repo owner declares that repo's dependencies where they live
  Status: todo
  Given a repo producing or consuming cross-repo artifacts
  When its interface changes
  Then only its own `.repo/cross-repo-interface.yml` is edited

Scenario: the whole workspace graph stays derivable from per-repo declarations
  Status: todo
  Given every repo's interface file plus bootstrap seed entries for repos not yet declaring
  When control aggregates
  Then it renders one generated `deps-graph.yml` merging declarations over seeds
  And the generated file is committed for readability, never hand-edited

Scenario: a dangling consumption is an error, not silent drift
  Status: todo
  Given an `upstream:` entry naming an artifact no repo produces
  When aggregation runs
  Then it fails naming the consumer and the missing artifact

Scenario: bootstrap seeds shrink as repos start declaring
  Status: todo
  Given a repo adds its own `.repo/cross-repo-interface.yml`
  When its seed entry is removed
  Then aggregation output stays unchanged for that repo

<!-- [<] 🤖🤖 -->
