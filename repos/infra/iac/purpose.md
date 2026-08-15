# Purpose

## What It Is

Terraform for the `konradodwrot` GitLab group: the group tree, every project, branch protection, GitHub mirroring, and the machine identities automation runs on. The identities: the sandbox identity (Developer group token, SSH access and signing keys, a least-privileged GCP service account), the control identity (Maintainer group token for regen MRs, a masked CI variable on the control project only), the prose tag-minting project token, and release signing. Sensitive values flow through GCP Secrets Manager and 1Password; state sits in its own GCS bucket.

## Why It Exists

Repos, their protection, and automation identities are stateful infrastructure: clicked-together settings drift and cannot be reviewed. One repo declares them all, applied by the user's own identity, never by a sandbox. GitLab permission inheritance is additive-only, so every token's reach is designed here, deliberately.

## Goals

- One repo owns the `konradodwrot` group tree: groups, projects, protections, mirrors.
- Automation identities as code: sandbox (Developer: write, no delete), control (Maintainer: regen MRs, auto-merge), prose tagger, release signing.
- Least privilege: each token and service account reaches only what its flow needs.
- State isolated at the storage boundary: a separate GCS bucket.
- Nothing secret committed: every sensitive value lives in Secrets Manager / op, every sensitive attr is masked.
