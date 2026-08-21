# Purpose

## What It Is

Two CI base images for the `konradodwrot` repos, each a multi-arch buildx
manifest (amd64 native, arm64 qemu-emulated) in this project's container
registry. `ci-linux`: `debian:bookworm-slim` plus the shared CI toolchain (go,
che, lefthook, yq, zsh, ruby, clang, make, git, zig, goreleaser, golangci-lint,
terraform, glab, op). `ci-linux-dind`: ci-linux plus the static docker CLI for
docker-in-docker jobs. A che release (go-modules main) rebuilds here. Each
release reaches `cross-repo/automation` as an event, which raises
`CI_IMAGES_REF` in iac.

## Why It Exists

Every repo's CI ran the same bootstrap: pull a golang base, `apt-get`
clang/make/zsh, `go install che@latest` and `lefthook@latest`. Compiling che
(1Password CGO SDK, tree-sitter) cost ~4-5 min per pipeline. Baked once, that
is a cached image pull.

## Goals

- One shared, versioned CI base image every repo pulls.
- Multi-arch tags: one buildx build per image, MR pipelines warm the cache, tag/main pipelines publish.
- Tool versions pinned in `ci/tool-versions.env`.
- Public-pullable: cross-project pulls need no auth.
- No per-job che compile, no per-job tool downloads.
- Che releases propagate: rebuild here, publish the pin through automation.
