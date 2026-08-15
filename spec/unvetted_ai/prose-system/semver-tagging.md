# Feature: Prose Semver Tagging

<!-- [>] 🤖🤖 -->

Every merge to main mints one semver tag `vX.Y.Z`. The bump is inferred from
the diff between the last tag and HEAD over the prose content dirs
(`conventions/`, `repos/`, `shared/`, `templates/`): deletes and renames are
breaking (major), additions are features (minor), everything else is a patch.
A commit message token `semver: major|minor|patch` overrides inference.

Scenario: a merged change becomes consumable without any manual release step
  Status: todo
  Given a commit lands on main
  When the tag job runs
  Then it mints and pushes the next `vX.Y.Z` tag
  And the first tag ever minted is `v0.0.1`

Scenario: a removed or renamed prose file never sneaks into an auto-merged update
  Status: todo
  Given the tag..HEAD diff deletes or renames a file under a prose content dir
  When the bump is inferred
  Then the bump is major

Scenario: new prose arrives downstream as a feature, not a break
  Status: todo
  Given the tag..HEAD diff only adds files under prose content dirs
  When the bump is inferred
  Then the bump is minor

Scenario: an in-place edit ships as a patch
  Status: todo
  Given the tag..HEAD diff only modifies existing files
  When the bump is inferred
  Then the bump is patch

Scenario: an author overrides inference when they know better
  Status: todo
  Given a commit in tag..HEAD carries a `semver: major|minor|patch` token in its message
  When the bump is computed
  Then the token wins over diff inference
  And with several tokens the largest bump wins

<!-- [<] 🤖🤖 -->
