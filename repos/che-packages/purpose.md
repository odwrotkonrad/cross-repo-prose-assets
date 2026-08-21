# Purpose

## What It Is

che's package catalog: `packages.yml` declaring every package, its install methods per manager and platform, and its verify commands, plus the `scripts/` those entries reference. Published as a versioned definitions tarball che fetches and embeds. A pytest suite installs each package for real, one throwaway container per (package, method).

## Why It Exists

The catalog is data with its own release cadence: a version bump or a new package should not go through a Go module, a `go.work` entry and a monorepo pipeline. A package failing to install and an installer failing break for different reasons, so the suites live apart: method coverage with che's code, package coverage here with the data.

## Goals

- Catalog editable with no Go toolchain: `packages.yml` and nothing else.
- Every entry validated automatically: schema, resolvable methods, derivable verify commands.
- Two install tiers: a few packages per method on every MR, the whole catalog manual and optional.
- Both linux arches proven on native runners, no emulation, no macOS runner, no local VM.
- Tagged releases fetchable forever, `latest` alias driving `che packages update`.
