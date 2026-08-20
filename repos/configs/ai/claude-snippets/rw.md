Repo: {{ env.Getenv "PWD" }}

pwd must equal the repo path above. On mismatch at task start: stop, tell the
invoker to re-invoke with that pwd.

Update agent memory as you discover codepaths, patterns, library locations,
architectural decisions: concise notes, what and where. Record implementation
difficulties under a `## Obstacles` heading.
