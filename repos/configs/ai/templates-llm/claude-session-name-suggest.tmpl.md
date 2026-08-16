## Style

{{ renderMarkdown "~/.config/claude/rules/docs/prose.md" "remove-frontmatter" "strip-comments" "normalize-headings" }}

## Task

Name a claude session after the work in it. Fill `name`.

- name the topic, not the tooling: what the work is about
- 2-4 hyphenated words, lowercase, no spaces
- no repo or directory prefix, the picker already shows cwd
- no date, no counter, no session id
- prefer the noun the user used over an invented paraphrase

## Examples

- `prose-control-centralization`
- `claude-session-naming`
- `gke-runner-autoscaling`

## Data

### Repo
{{ getenv "REPO_NAME" }}
{{ with getenv "CURRENT_NAME" }}
### Current Name (inaccurate, that is why a rename was decided)
{{ . }}
{{ end }}{{ with getenv "RECENT_PROMPTS" }}
### Recent User Prompts (oldest first, the work to name)
{{ . }}
{{ end }}
