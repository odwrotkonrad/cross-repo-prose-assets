# Purpose

## What It Is

Semver-tagged home of the contract every workspace repo obeys: conventions with runnable examples, and per-repo behavior specs under `repos/<repo-path>/spec/` (user stories, Gherkin scenarios, technical requirements, vetting dirs).

## Why It Exists

Humans and agents read a convention or spec before changing code. Only a conventions summary renders into repos, so nothing here needs to share a release stream with purpose docs and templates. Apart, a spec edit never re-renders assets, and consumers pin the contract independently.

## Goals

- One canonical home for conventions and specs, versioned apart from rendered prose.
- `repos/<repo-path>/` mirrors the GitLab group tree, `repos/shared/` holds behavior every repo shares.
- Specs change here before the repo does: status per story, vetting dirs decide what AI may touch.
- Every merge to main mints a semver tag. Consumers pin it through `PROSE_SPEC_REF`.
- Each release triggers `cross-repo/automation`, which re-renders the conventions summary into affected repos.
