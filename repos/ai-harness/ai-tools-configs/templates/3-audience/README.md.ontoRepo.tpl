# configs

The AI toolchain as che profiles.

{{ renderMarkdown "assets/docs-agents/purpose.md" "normalize-headings" }}

## Layout

- `profiles/base/` — the agent prose payload (`~/.config/ai-agents/docs`), the LLM-backed git wrappers (`git-*-upsert.zsh`, `llm-*-suggest.zsh`, `lib/llm-lib.zsh`) and `/etc/custom/llm.yml`.
- `profiles/claude/` — claude rules, skills, output styles, `settings.json`, ccstatusline, and the `claude/virt` snippets every workspace repo renders its agent files from.
- `profiles/codex/` — codex configuration.
- `profiles/ollama/` — ollama, host only.
- `che.yml` — publishes `ai/base/macos`, `ai/host/macos`, `ai/virt/linux` and `claude/virt`.

## Profiles

`ai/base/macos` is the shared macos payload (base, claude, codex). `ai/host/macos` adds ollama and runs only off-virt. `ai/virt/linux` is the linux/virt payload. `claude/virt` is the per-repo render: a consumer repo includes it remotely with `ctx: {repo: <Repo>}` and gets `.claude/agents/{ro,rw}.md`, `.claude/settings.json` and `.claude/.gitignore`.

## License

MIT — see [LICENSE](LICENSE).
