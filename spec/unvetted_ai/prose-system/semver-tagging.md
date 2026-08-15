# Feature: Prose Semver Tagging

<!-- [>] 🤖🤖 -->

Every merge to main mints one semver tag `vX.Y.Z`, bumping the patch. Prose
grows by adding files, so an add is not a release event: only a
`semver: major|minor|patch` commit token lifts a release above patch. The last
tag is read from the remote, never from the local clone.

Scenario: a merged change becomes consumable without any manual release step
  Status: implemented
  Given a commit lands on main
  When the tag job runs
  Then it mints and pushes the next `vX.Y.Z` tag
  And the first tag ever minted is `v0.0.1`

Scenario: a routine prose change ships as a patch
  Status: implemented
  Given a tag..HEAD diff that adds, edits or deletes prose files
  When the bump is computed without a `semver:` token
  Then the bump is patch

Scenario: an author lifts a release above patch when the change warrants it
  Status: implemented
  Given a commit in tag..HEAD carries a `semver: major|minor|patch` token in its message
  When the bump is computed
  Then the token decides the bump
  And with several tokens the largest bump wins

Scenario: a stale local tag never decides the release
  Status: implemented
  Given a clone whose local tags differ from the remote
  When the bump is computed
  Then the last tag comes from the remote
  And the minted tag follows the remote's latest, not the clone's

<!-- [<] 🤖🤖 -->
