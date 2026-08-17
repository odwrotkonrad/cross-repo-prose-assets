---
paths:
  - "**/zsh/**functions"
---

## ZSH Functions

Autoload from `zsh/<phase>.d/functions/`: `zshenv.d` for all shells, `zshrc.d` for interactive. Filename is the function name (`rm` shadows the command, `fn-root-*` called as-is).

Put tiny eager helpers inline in `10-functions.zsh`. Give larger or lazy functions their own autoload file under `functions/`.

Start every function with `emulate -LR zsh`.
- `-R` reset options to defaults
- `-L` sets: `LOCAL_OPTIONS`, `LOCAL_PATTERNS`, `LOCAL_TRAPS`.
