# Feature: Prose Centralization

<!-- [>] 🤖🤖 -->

One semver-tagged `prose` repo is the canonical home of all workspace prose:
conventions, purpose docs, README sources, specs, shared doc fragments,
canonical doc templates. Downstream repos own assembly: their `che.yml`
renderTemplates consume prose artifacts at a pinned version and render their
own docs. Prose provides artifacts, never renders into other repos.

Scenario: an author edits any workspace prose in one repo
  Status: todo
  Given prose centralized under `conventions/`, `repos/<repo-path>/`, `shared/`, `templates/`
  When any convention, purpose doc, README source, spec, or shared fragment needs a change
  Then the edit lands in the prose repo only
  And no downstream repo carries its own copy of that prose

Scenario: a downstream repo keeps full control of its own doc assembly
  Status: todo
  Given a downstream repo's `che.yml` renderTemplates pinned to a prose version
  When the repo renders its docs
  Then its own templates decide what is assembled and where it lands
  And prose supplies only the consumed source artifacts

Scenario: per-repo prose stays findable by repo path
  Status: todo
  Given `repos/<repo-path>/` mirroring the GitLab group tree
  When anyone looks for a repo's purpose doc, README source, or specs
  Then they find them under that repo's path in the prose repo

Scenario: prose pieces join into downstream-ready artifacts at the source
  Status: todo
  Given several prose pieces a downstream consumes as one document
  When the combined artifact is produced
  Then prose renders the join itself and ships one ready artifact
  And the downstream only places it, never re-assembles the pieces

Scenario: rendered doc assemblies leave downstream version control
  Status: todo
  Given AGENTS.md, CLAUDE.md, and their generated intermediates (makefile doc, repo structure) assembled from prose-sourced pieces
  When a repo consumes prose at a pinned version
  Then the repo gitignores these rendered outputs and renders them on demand
  And the only checked-in source of their content is the prose repo

Scenario: the workspace repo index is generated from prose, never checked in
  Status: todo
  Given per-repo prose under `repos/<repo-path>/` mirroring the group tree
  When a workspace or subgroup repo index is needed
  Then it is generated from prose's repos tree, without a clone sweep
  And no repo or worktree checks the rendered index in
  And local worktrees refresh it like any other non-checked-out output

Scenario: prose shared by several repos has exactly one home
  Status: todo
  Given a doc fragment consumed by more than one repo
  When it is authored or changed
  Then it lives under `shared/`, never duplicated per repo

<!-- [<] 🤖🤖 -->
