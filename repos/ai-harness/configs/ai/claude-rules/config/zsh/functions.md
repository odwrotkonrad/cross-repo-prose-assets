---
paths:
  - "**/zsh/**functions"
---

## ZSH Functions

Autoload from `zsh/<phase>.d/functions/`: `zshenv.d` for all shells, `zshrc.d` for interactive. Filename is the function name (`rm` shadows the command, `fn-*` called as-is).

Tiny eager helpers go inline in `10-functions.zsh`. Larger or lazy ones get their own autoload file under `functions/`.

Start every function with `emulate -LR zsh`.
- `-R`: reset options to defaults.
- `-L`: `LOCAL_OPTIONS`, `LOCAL_PATTERNS`, `LOCAL_TRAPS`.
