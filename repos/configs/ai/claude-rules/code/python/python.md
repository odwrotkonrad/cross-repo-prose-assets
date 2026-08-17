---
paths:
  - "**/*.py"
  - "**/root/usr/local/scripts/python/**"
  - "/usr/local/scripts/python/**"
  - "**/ci/python/scripts/**"
---

## Python

### General

- Use modern Python 3.14 features.
- Prefer operators over equivalent functions: `a | b`, `a |= b`, `xs + ys`, `xs += ys`.

### Typing

- Type every function arg and return with defined types.
- Declare semantic types: `type X = base`, named after the base type (`SecretStr`).
- Explain a semantic type with a trailing `"""..."""` (IntelliSense-visible), not `#`.

```python
type SecretStr = str
"""what is SecretStr?"""

type SecretDecryptedStr = str
type OPRequestTimeoutInt = int
```

### Docstrings

- *What* goes in the docstring `"""..."""`.
- *Why* goes above the function, only when non-obvious and explicitly asked.
- Trace the input-to-output path as a numbered list.
- List non-obvious external interfaces (filesystem, network, `op read`, URL) under `Interfaces with:`. Omit `stdio`.

```python
# why it exists?
def f(arg: InT, opt: OptT = default) -> OutT:
    """<what it does>.

    1. <step from input>.
    2. <transform>.
    3. <return output>.

    Interfaces with:
      - `$ <cmd>` — <external interface>
      - <url> — <external interface>
    """
```

### Functions

- Write pure functions: output depends only on input.
- Treat inputs as immutable: construct and return new values.
- Keep impurity at the edges.
- Pass exactly what a function needs as args (no globals, no whole-dict).
