# Purpose

## What It Is

One semver-tagged repo holding the contract every workspace repo obeys: the conventions with their runnable examples, and every repo's behavior specs under `repos/<repo-path>/spec/` (user stories, Gherkin scenarios, technical requirements, vetting dirs).

## Why It Exists

A convention or a spec is read by humans and agents before code changes. It is not rendered into any repo, so it has no reason to share a release stream with purpose docs and templates. Apart, a spec edit never forces a re-render of assets, and a consumer pins the contract version independently.

## Goals

- One canonical home for conventions and specs, versioned apart from rendered prose.
- `repos/<repo-path>/` mirrors the GitLab group tree, `repos/shared/` holds behavior every repo shares.
- Specs are edited here before the repo changes: status per story, vetting dirs decide what AI may touch.
- Every merge to main mints a semver tag. Consumers pin it through `PROSE_SPEC_REF`.
- Each release triggers `cross-repo/automation`, which re-renders the conventions summary into affected repos.
