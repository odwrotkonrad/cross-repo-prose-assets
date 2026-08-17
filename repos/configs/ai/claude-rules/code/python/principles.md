## Python Principles

### Clarity

- Explicit beats implicit. Magic is never clear.
- Flat beats nested. Readable at scale beats clever.
- Least mechanism: language construct, then stdlib, then internal lib, then third party.
- One obvious way to do it. Pick it, keep it.

### Functions

- Write pure functions: output depends only on input.
- Treat inputs as immutable: construct and return new values.
- Keep impurity at the edges.
- Pass exactly what the function needs, never a whole config or globals.
- Return early: happy path at minimal indentation.

### Types

- Type every argument and return.
- Untyped and `Any` say nothing.
- Name the meaning, not the storage: semantic aliases over bare `str`, `int`.
- The narrowest type that admits every valid value.

### Data

- Define the data before the code that moves it.
- Model records as dataclasses or pydantic, never ad-hoc dicts.
- Prefer immutable structures. Mutate only what you own.

### Errors

- Treat errors as fatal: let them propagate and crash.
- Catch the exact exception, never bare `except`.
- Catch only where you can act. Elsewhere, add context and re-raise.
- Add fallbacks and recovery only when asked.

### Modules

- A good module starts with a good name: short, lowercase, no `util`, no `common`.
- Module name is part of the API: `http.Client`, not `http.HTTPClient`.
- Avoid module-level state and import-time side effects.
- A little copying beats a little dependency.

### Iteration

- Comprehensions over accumulator loops.
- Generators when the sequence is large or unbounded.
- Iterate the object, not its indices.

### Performance

- If you think it is slow, prove it with a benchmark.

### API

- Docstrings on every public symbol: they are for users.
- Tests lock in the API contract.
- ruff and mypy settle style.
