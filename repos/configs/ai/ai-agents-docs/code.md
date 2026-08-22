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
