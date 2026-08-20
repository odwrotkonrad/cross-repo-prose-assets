# Purpose

## What It Is

Terraform for the `konradodwrot` GitLab group: group tree, every project, branch protection, GitHub mirroring, and the machine identities automation runs on. The identities: sandbox (Developer group token, SSH access and signing keys, a least-privileged GCP service account), control (Maintainer group token for regen MRs, a masked CI variable on the control project only), the prose tag-minting project token, the homebrew-tap publisher token, release signing. Secrets flow through GCP Secrets Manager and 1Password. State sits in its own GCS bucket.

## Why It Exists

Repos, protections and automation identities are stateful infrastructure. Clicked-together settings drift and cannot be reviewed. One repo declares them all, applied by the user's own identity, never by a sandbox. GitLab permissions inherit additively: a token granted on a group reaches every subgroup, nothing fences one off. So each token's reach is designed here, on purpose.

## Goals

- One repo owns the `konradodwrot` group tree: groups, projects, protections, mirrors.
- Automation identities as code: sandbox (Developer: write, no delete), control (Maintainer: regen MRs, auto-merge), prose tagger, release signing.
- Least privilege: each token and service account reaches only what its flow needs.
- State isolated at the storage boundary: a separate GCS bucket.
- Nothing secret committed: every sensitive value lives in Secrets Manager / op, every sensitive attr is masked.
