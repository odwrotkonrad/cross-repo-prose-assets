## Ruby Principles

### Clarity

- Optimize for the reader. Cleverness is never clear.
- Least surprise: a method does what its name promises, nothing more.
- Least mechanism: language construct, then stdlib, then internal lib, then gem.
- Metaprogramming is a last resort. `method_missing` and `define_method` hide the API.

### Objects

- Tell, don't ask: send a message, never interrogate state and decide for the object.
- Small public surface. Everything else `private`.
- An object owns its data. Expose behavior, not attributes.
- Name the object for what it is, the method for what it does.

### Modules

- Compose with mixins. No deep inheritance chains.
- A module is a namespace or a behavior, never both.
- Extract a module when a second includer exists, not before.

### Duck Typing

- Respond to the message, don't check the class.
- `respond_to?` over `is_a?`. Neither beats calling the method.
- The interface is the set of messages, nothing declares it.

### Blocks

- Blocks scope resources: acquire, `yield`, release in `ensure`.
- `yield` over an explicit `&block`, unless the proc is stored or passed on.
- A block is the extension point. Reach for it before an options hash.

### Enumerable

- Chain `Enumerable` over hand-rolled loops.
- Return new collections. Mutate only in a `!` method, and only what you own.
- `each` for effects, `map` for values. Never `map` for effects.

### Errors

- Raise a specific `StandardError` subclass, never a bare `RuntimeError`.
- Rescue the narrowest class, never `Exception`, never a bare `rescue`.
- Rescue only where you can act. Elsewhere, add context and re-raise.
- `ensure` for cleanup, always.

### Nil

- `nil` is not a value: return a null object, a default, or raise.
- Guard at the boundary, not at every call site.

### Gems

- A good gem starts with a good name: short, lowercase, no `util`, no `common`.
- Stdlib before a gem. A little copying beats a little dependency.
- Lock what you depend on.
- Avoid global state and load-time side effects.

### Performance

- If you think it is slow, prove it with `benchmark-ips`.

### API

- Public methods are documented for users. Private helpers get none.
- Tests lock in the API contract.
- RuboCop settles style.
