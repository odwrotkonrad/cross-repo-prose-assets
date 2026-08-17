# Purpose

## What It Is

che's package catalog: `packages.yml` declaring every package, its install methods per manager and platform, and its verify commands, plus the `scripts/` those entries reference. Published as a versioned definitions tarball che fetches and embeds. A pytest suite proves each package installs for real, one throwaway container per (package, method).

## Why It Exists

The catalog is data on its own release cadence. A version bump or a new package should not enter through a Go module, a `go.work` entry and a monorepo pipeline. Proving a package installs breaks for different reasons than proving an installer works, so the suites live apart: method coverage stays with che's code, package coverage lives here with the data.

## Goals

- Catalog editable with no Go toolchain: `packages.yml` and nothing else.
- Every entry validated automatically: schema, resolvable methods, derivable verify commands.
- Two install tiers: a few packages per method on every MR, the whole catalog manual and optional.
- Both linux arches proven on native runners, no emulation, no macOS runner, no local VM.
- Tagged releases fetchable forever, `latest` alias driving `che packages update`.
