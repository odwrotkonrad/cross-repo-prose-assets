# Purpose

## What It Is

Declarative SSH key lifecycle, Ruby only. One config states the keys that should exist and where they publish, one state file records what reality is, and `user-ssh-util sync` reconciles the two, rotating whatever is past its period. Platform calls shell out to `glab` and `gh`, already authenticated on the host, so the tool handles no tokens. Signing keys keep `allowed_signers` in step, rotation refreshes `known_hosts`.

## Why It Exists

Keys were created by hand, published by hand, and never rotated. Nothing recorded which key exists, where it was published, when it was created, or when it is due for replacement. A declared config plus a recorded state makes rotation a command instead of an afternoon.

## Goals

- One config declares every key and its publish targets, one command reconciles.
- Rotation ordered so a failure never locks the user out: publish and verify the new key before revoking the old.
- Superseded grants revoked by default, only once the replacement is proven, and only after the operator confirms.
- Private keys never destroyed: superseded keypairs are archived, not removed.
- Every on-disk write and platform call behind a seam, so the whole rule set is unit-tested without touching a real account.
