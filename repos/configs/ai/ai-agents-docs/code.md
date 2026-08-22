# Code

## Operations

- Write idempotent (upsert) operations: re-running yields the same state.

## Documentation

- Prefix shell commands with `$`: `` `$ git status` ``.
- Keep docstrings and comments abrupt, terse, specific.

## Naming

- Pack max info into the name.
- Follow `noun_noun_verb`, max 3 parts: `user_email`, `commit_msg_suggest`.
- Name a value for why it exists here, never for its type: `active_subscribers`, not `list`.
- Hide a condition behind a named predicate: `is_active_subscriber(user)`, not `user.status == 1`.
- A name that needs a comment is wrong: rename.

## Conciseness

- Use the runtime's modern, concise syntax.
- Keep code short.
- Split hard-to-read code into steps.

## Control Flow

- Reject what you cannot handle first: guard clauses, then the real work.
- Keep the main path at the left edge, the main action as the last line.
- Three levels of nesting: flip the conditions before touching anything else.

## Level Of Detail

- **One function, one level of detail: orchestrate or compute, never both.**
- Top level reads as named steps: `price_of`, `charge_customer`, `send_confirmation`. Details live one level down.
- Narrating "and then inside that loop" means split.

## Structure

- Sectionize code via comments.
- Group code by similarity within a section.
- Define processed data up front: JSON schema, docstring, data structures.

## Rules Apart From I/O

- Put a decision in its own pure function: input in, result out, no db, network, filesystem.
- The outer function fetches, calls the rule, saves. Dull is fine there.
- A test that needs a mock signals a rule in the wrong place.

## Error Handling

- Treat errors as fatal: let them propagate and crash.
- Add error handling, fallbacks, recovery only when asked.
- Log full error detail: message, cause, context.
- Surface errors and their output.

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

## Tests

Asked for tests: unit tests, unless told otherwise.

- Unit: a software deliverable (function, class, command, subcommand).
- Process: a running instance of a program, as in OS nomenclature.
- External interface: anything outside the process a unit can talk to (services, filesystem, db, OS operations).

External interface use and assertion scope decide the test type.

### Test Types

- **Unit**: scoped to the deliverable, no external interfaces.
- **Integration**: scoped to the deliverable, with direct external interfaces.
- **E2E**: assertions scoped beyond the deliverable, with external interfaces.
