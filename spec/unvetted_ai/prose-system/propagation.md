# Feature: Prose Release Propagation

<!-- [>] 🤖🤖 -->

A fresh prose tag triggers the `control` pipeline. Control resolves affected
downstreams from the dependency graph, regenerates each one via its own
`make render-templates`, and opens a bot MR bumping the repo's prose pin.
Patch and minor MRs auto-merge on green CI; major MRs wait for a human.

Scenario: a prose release reaches every affected downstream without human toil
  Status: implemented
  Given a new prose tag and its trigger into control
  When control's pipeline runs
  Then it derives the affected downstreams from the dependency graph
  And regenerates each affected downstream with that repo's own render targets

Scenario: a downstream repo receives a reviewable, deterministic bot MR
  Status: implemented
  Given a regenerated downstream with a diff
  When control opens the MR
  Then the MR bumps only the prose pin and the rendered outputs
  And its title and description follow the fixed template naming old and new versions

Scenario: safe updates flow through unattended, breaking ones wait
  Status: implemented
  Given a regen MR for a patch or minor prose bump
  When the downstream pipeline passes
  Then the MR auto-merges
  And a major-bump MR never auto-merges

Scenario: a red downstream pipeline blocks propagation instead of shipping breakage
  Status: implemented
  Given a regen MR whose downstream pipeline fails
  When auto-merge is evaluated
  Then the MR stays open for a human

<!-- [<] 🤖🤖 -->
