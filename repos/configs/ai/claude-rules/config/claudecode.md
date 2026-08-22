---
paths:
  - "**/claude/settings.json"
  - "**/claude/settings.json.ontoHost.tpl"
  - "**/.claude/settings.json"
  - "**/.claude/settings.local.json"
  - "**/.zclaude"
  - "**/.claude.json"
  - "**/Application Support/ClaudeCode/**"
---

## Claude Code Config

### Files

```yml
root/_home/.config/claude/:
  settings.json.ontoHost.tpl:
  agents/:
  agent-memory/:
  commands/:
  output-styles/:
    interactive-code.md:
  skills/:
    user-decipher-code/:
      SKILL.md:
      scripts/:
        print-lang-principles.sh:
        resolve-scope.sh:
    user-git-ops/:
      SKILL.md:
    user-humanize-prose/:
      SKILL.md:
      scripts/:
        resolve-scope.sh:
    user-junior-wrote-this-code-refactor-redesign/:
      SKILL.md:
    user-prettify-code/:
      SKILL.md:
      scripts/:
        print-lang-principles.sh:
        resolve-scope.sh:
  themes/:
  rules/:
    code/:
      go/:
        principles.md:
      python/:
        principles.md:
        python.md:
        scripts.md:
      ruby/:
        principles.md:
      zsh/:
        zsh.md:
    config/:
      claudecode.md:        # this file
      git.md:
      ssh.md:
      vscode.md:
      zsh/:
        functions.md:
        zsh.md:
  plugins/:
    installed_plugins.json:
    known_marketplaces.json:
    marketplaces/:
```

Global instructions (`~/.config/claude/CLAUDE.md`) sit outside this tree, rendered by the llm/base profile from prose/assets `repos/configs/ai/ai-agents-templates/AGENTS.md.ontoHost.tpl`. They are assembled from four `@`-includes of `~/.config/ai-agents/docs/`: `system.md` (tools, configs, git workflow), `code.md` (code rules, tests), `comments.md` (🤖 marks, no-comments rule, docstrings), `prose.md` (prose style, agent instructions).

Project instructions live in `<repo>/.claude/` (preferred) or `<repo>/CLAUDE.md`.

### Documentation

Local: `$ claude --help`

Online:
- settings.json schema: https://json.schemastore.org/claude-code-settings.json
- docs base: `https://code.claude.com/docs`
- pages index: `/llms.txt` · all-in-one: `/llms-full.txt`
- keywords: settings, permissions, memory, env-vars, cli-reference, claude-directory, commands, sub-agents, skills, output-styles, plugins, plugins-reference, hooks, mcp
