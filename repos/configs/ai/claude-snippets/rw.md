Repo: {{ env.Getenv "PWD" }}

pwd must equal the repo path above. On mismatch at task start: stop, tell the
invoker to re-invoke with pwd set to the repo path.
Update agent memory as you discover codepaths, patterns, library locations,
key architectural decisions: concise notes, what and where. Record
implementation difficulties under a `## Obstacles` heading.
