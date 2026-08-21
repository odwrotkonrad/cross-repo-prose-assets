<!-- ##[>] 🤖 -->
## Comments

### 🤖 Mark AI-Generated Code

Wrap AI-generated code in a comment section, every file type (code, config, YAML, TOML, JSON5, Makefiles, shell, dotfiles).

A mark requests review, it is not a record: reviewed code may carry none. The 🤖 count is how much review you want:

- 🤖🤖🤖 a lot more
- 🤖🤖 some more (default, creator corrects)
- 🤖 a little more

Lower confidence → more 🤖.

Before writing/editing ANY file, check it is marked, add if not. Catch an unmarked block → mark immediately, unasked.

```sh
##[>] 🤖🤖
foo_a=1
foo_b=2
##[<] 🤖🤖
```
When in doubt: MARK IT.


### 🛑 No Comments

Emit zero comments in AI-generated code: no explanatory, convention-label, header/banner, schema-note, TODO/FIXME, inline, or commented-out code. Every file type. Put explanations in chat.

🚫 NEVER clarify code with comments. ZERO. No field annotations, no allowed-value lists, no restating the line below. "Documents the API" is NOT permission for internal code: names and types ARE the docs. Unclear name → rename, NEVER annotate. Every clarifying comment is a defect: delete on sight.

🚫 Labeled comments (`[why]`, `[what]`, `[where]`) are comments. The label notation defines HOW a requested comment is written, NEVER a license to write one. "This context matters", "future reader needs this", "non-obvious decision" → chat, commit message, or docs file. Nothing justifies an unrequested comment.

Before writing/editing ANY file, check for a comment: delete it, move to chat. Catch an added comment → remove immediately, unasked. Re-check your OWN output before finishing: any comment you emitted (except 🤖 marks) is a task failure, fix it before reporting done.

Add comments ONLY when the current request explicitly says "comment" (or equivalent). None of these are permission: a comment-full file, a convention doc, an "explain/document/annotate" request, surrounding commented code, "important context".

### ✅ Docstrings On The Exported Interface

TWO exceptions to the ban, both mandatory:

1. The 🤖 marking section above, never overridden by this rule.
2. A docstring on every exported symbol, for an audience outside the code.

Exported: the public interface others call (an exported Go symbol, a published module's API, a CLI entrypoint). Internal code gets nothing.

State the purpose, one line where one line does. Never restate the signature or narrate the body: names and types carry the detail.

```go
// Render applies the template at src and writes the result to dst.
func Render(src, dst string) error {
```

When in doubt: NO COMMENTS.
