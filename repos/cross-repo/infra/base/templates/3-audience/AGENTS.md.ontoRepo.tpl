# base

The GCP org foundation, every machine identity, every secret, the GitLab tree, the terraform state buckets and the artifact registries, as Terraform.

@assets/docs-agents/purpose.md

## Applied Locally, Never By CI

Every mutation here runs locally under the user's admin identity. This repo's
pipeline holds `base-publisher`, read-only on the state bucket, and publishes
outputs. Never add a `plan` or `apply` job, never add `resource_group:
terraform`: both exist in every other terraform repo in the group and neither
belongs here. A plan job would fail on the state lock anyway, by design.

Long-running applies belong to the user. Prepare the config, reach an
import-only plan, hand over the command.

## Moving Resources In

Resources arriving from another root are imported here first, applied, and only
then dropped from the old root with `removed { lifecycle { destroy = false } }`.
Never the reverse order, never a destroy. Check every plan for delete actions
before applying it:

```sh
terraform show -json tf/plan.tfplan | jq '[.resource_changes[] | select(.change.actions | index("delete"))]'
```

`[]` is the only acceptable result.

A repo is moved, never deleted. A plan containing a `gitlab_project` destroy is
wrong whatever prompted it: retiring a repo means emptying and archiving it.

## Custom Roles Only

Every identity holds a `google_project_iam_custom_role` (or org-level) with an
explicit permission list, bound at the narrowest resource that works. No
predefined role, no `*.admin`, including for the GKE node and job service
accounts.

Derive the list from the resource families the identity's own terraform
declares, never by reading a predefined role top to bottom. Intersecting the
predefined role's permissions with the `google_*` resource types under a module
cuts most of it mechanically: for the nine roles held on the ci project, 171 of
1762 permissions touch a family the config actually declares.

```sh
gcloud iam roles describe roles/<name> --format='value(includedPermissions)' | tr ';' '\n'
grep -rhoE '^resource "google_[a-z_0-9]+"' <module>   # the families that matter
```

Then cut by verb against the config: no `delete` for something the module never
destroys, no `setIamPolicy` where it binds no policy. A name match also pulls in
false positives (`cloudkms.projects.*` arrives via any `project` resource) —
drop them.

Check every permission is real and usable in a custom role before applying, a
failure separate from the list being incomplete:

```sh
gcloud iam list-testable-permissions "//cloudresourcemanager.googleapis.com/projects/<proj>" \
  --format='value(name,customRolesSupportLevel)'
```

A permission missing from that list, or marked `NOT_SUPPORTED`, fails the apply.

A missing permission surfaces as a broken apply or a broken cluster, so prove a
role by running a full `make plan` under the identity that holds it. The
exception is the node identity's puller role: its consumer is containerd, not
terraform, so a plan proves nothing and it is verified by watching a pod pull
after a node pool drain.

If a list proves unworkable for one identity, fall back to a narrowly-scoped
predefined role for that one and say so in the MR, rather than blocking the
split.

## Secrets

Every secret in the group is created here and nowhere else, routed by audience:
1Password for personal use, GCP Secret Manager for automation, a masked CI
variable on the consuming project for CI. A CI variable exists only where a
consumer needs it for CI, not for every identity.

A sensitive value never propagates and never enters an output. The token
resource and the variable resource sit in one state, so the value never leaves
terraform. The single secret-derived output is `secrets_hash`, a hash over all
secret values: rotating a secret moves it, which is what turns a rotation into
a release. Adding any other sensitive output is a defect:

```sh
terraform output -json | jq 'map(select(.sensitive))'
```

Only `secrets_hash` may appear.

SSH keys are not created here or in any infra repo, and are no longer managed
by terraform at all: nothing will re-create them if deleted by hand.

## Specs Before Implementation

This repo's behavior specs live in the spec repo (`cross-repo/prose/spec`): `repos/cross-repo/infra/base/spec/`. Two forms sharing a stem: `<feature>.story.md`
user stories by default, `<feature>.scenarios.md` Gherkin only for
automation-bound behavior. Functionality added / modified / removed → edit
those specs FIRST, then implement, then set each touched status. Status closes
the title in parentheses: `### <story title> (todo)`, `Scenario: <title>
(implemented)`. New: `(todo)`. Removed: delete the story, same change. Never
implement unspecced.

Vetting dirs bound edits: `vetted/` never touch; `vetted_title_only/` story
titles and `Scenario:` lines frozen, rest editable, the trailing status stays
accurate; `unvetted_ai/` free rein, all new AI specs land here. Moving files,
stories and scenarios between dirs must come from human will.
`technical-requirements.md` same dirs, prefer `vetted/`: on add/change urge
the human to vet first.

@assets/data/makefile.agents.md

## Directory Tree

@assets/data/repo-structure.md
