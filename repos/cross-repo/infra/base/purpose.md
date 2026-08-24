# Purpose

## What It Is

Everything in the `konradodwrot` infrastructure applied by the user's own admin identity, never by CI: the GCP org foundation (folders, services, budget, the three project shells, the 1Password vaults), every machine identity and the custom role each one holds, every secret in the group, the GitLab tree the identities are scoped to, one terraform state bucket per CI-applied repo, and every artifact registry. Six submodules, one state, one apply. Its pipeline holds a read-only identity and does one thing: publish the applied outputs as a release artifact the other roots consume at a pinned `BASE_REF`.

## Why It Exists

The infra root split by apply identity first, concern second. One repo is applied locally by the user and exists so the rest can run; the CI-applied repos follow with least-privileged per-repo appliers. Two permissions can only live here: granting an applier its roles, and creating the bucket that applier writes state to. Neither can be done by the applier itself, which is why an earlier attempt to own a state bucket from a CI-applied root was reverted within hours. A pipeline able to apply this repo could mint itself any identity in the group, so none may.

Secrets and the containers identities are scoped to live here for the same reason. A secret created next to its consumer is created by that consumer's applier, which then holds the rights to mint it; a group, project or vault created next to the identity scoped into it lets that identity widen its own reach. Both belong to the one root no pipeline can apply.

## Goals

- Applied locally under the admin identity: no `plan` or `apply` job in CI, enforced by the publisher SA's read-only access to the state bucket.
- One protected/unprotected applier pair per CI-applied repo, each reaching only its own concern, replacing one identity holding every permission any concern needed.
- Every identity carries a custom role with an explicit permission list, bound at the narrowest resource: no predefined role, no `*.admin`.
- One state bucket per CI-applied repo: its protected applier writes, its unprotected applier only reads, neither reaches another repo's bucket.
- Every secret in the group created here and nowhere else, routed by audience: 1Password for personal use, Secret Manager for automation, a masked CI variable for CI.
- Sensitive values never propagate and never enter an output: the only secret-derived output is `secrets_hash`, which turns a rotation into a release.
- Outputs published as a generic-registry artifact of non-secret identifiers: no key, token or secret ever enters it.
- Downstream repos consume the release, never the state, so a local apply reaches CI only once the user cuts a tag.
- Resources migrate by `import` then `removed`, never destroy: no plan in the split deletes anything, and no repo is ever deleted.
