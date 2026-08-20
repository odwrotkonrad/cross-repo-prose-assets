# Misc

Shared CI scripts rendered into every workspace repo.

{{ renderMarkdown "assets/docs-agents/purpose.md" "normalize-headings" }}

## Release

Every merge to main mints the next `vX.Y.Z` tag, patch by default, lifted by a `semver: major|minor|patch` commit token. The tag pipeline triggers [automation](https://gitlab.com/konradodwrot/cross-repo/automation), which re-renders the scripts into affected repos as regen MRs. Consumers pin this repo through `MISC_REF` (`GRP_KO_VAR_MISC_REF`):

```yaml
- source: "@gitlab.com/konradodwrot/cross-repo/misc?ref=vX.Y.Z"
  chmod: "0755"
  <<<:
    - source: //ci/semver-bump.zsh
      dest: ci/semver-bump.zsh
    - source: //ci/tag-mint.zsh
      dest: ci/tag-mint.zsh
```

## Layout

- `ci/`: the shared scripts. `semver-bump.zsh` prints the next tag, `tag-mint.zsh` mints and pushes it (CI: authed via `TAG_TOKEN`).

## License

[MIT](LICENSE)
