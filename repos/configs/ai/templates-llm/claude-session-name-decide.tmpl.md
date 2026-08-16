## Task

Decide whether the claude session should be renamed. Fill `rename`.

The session name should read as the work being done. Renaming costs a model
call and churns the session picker, so keep by default.

- `rename: false` when the current name still fits the prompts (~80%)
- `rename: true` when the name is cwd-derived, like `configs-18` or `konradodwrot-c8`
- `rename: true` when the prompts moved to a topic the name no longer covers
- a name narrower than the work is still a fit, do not rename for polish

## Data

### Current Name
{{ getenv "CURRENT_NAME" }}
{{ with getenv "RECENT_PROMPTS" }}
### Recent User Prompts (oldest first)
{{ . }}
{{ end }}
