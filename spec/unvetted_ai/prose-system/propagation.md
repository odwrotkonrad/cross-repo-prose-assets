# Feature: Prose Release Propagation

<!-- [>] 🤖🤖 -->

A fresh prose tag triggers the `control` pipeline. Control resolves affected
downstreams from the dependency graph, regenerates each one via its own
`make render-templates`, and opens a bot MR bumping the repo's prose pin. Patch
and minor MRs auto-merge on green CI. Major MRs wait for a human.

Scenario: the released tag reaches control as a pipeline variable
  Status: implemented
  Given the trigger job forwards its yaml variables to the downstream
  And job-scoped dotenv from an upstream job never crosses into a downstream pipeline
  When a tag pipeline triggers control
  Then control's pipeline carries the released tag as a pipeline variable
  And control resolves it without querying prose for the tag

Scenario: a prose release reaches every affected downstream unattended
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

Scenario: a red downstream pipeline blocks propagation instead of shipping a break
  Status: implemented
  Given a regen MR whose downstream pipeline fails
  When auto-merge is evaluated
  Then the MR stays open for a human

<!-- [<] 🤖🤖 -->
