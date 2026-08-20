# Purpose

## What It Is

Shared library for the sibling CLIs: `yamlcfg` (system + user YAML loading,
deep-merge, XDG fallback, `CodedError` exit codes), `climain` (`-h/--help`,
`-v/--version` dispatch, coded-exit epilogue). No binaries.

## Why It Exists

`get-os-open-files-with` and `get-term-open-files-with` carried byte-identical
config loaders and main boilerplate.

## Goals

- One config loader and one CLI main shape for the get-* CLIs.
- Minimal dependency surface: `gopkg.in/yaml.v3` only.
