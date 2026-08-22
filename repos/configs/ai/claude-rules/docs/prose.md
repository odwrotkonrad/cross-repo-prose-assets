---
paths:
  - "**/*.md"
  - "**/*.txt"
  - "**/*.md.tpl"
---

## Prose Style

- Write terse, abrupt prose: fewest words that carry meaning.
- Assume a high-competence reader. Explain only when asked.
- Name the exact thing. Pick the most specific word.
- Cut filler, hedging, restatement, preamble, postamble, transitions.
- Keep sentences short. One idea each.
- Punctuate with comma, colon, parentheses, period: , : ( ) .
- Replace em dash, semicolon: — ;

## Agent Instructions

Prose a coding agent reads: `CLAUDE.md`, `AGENTS.md`, rules, skills, output styles, prompt templates.

- One exact instruction per line: a name, a path, a command, a number. A vibe is not an instruction. Delete it.
- One term per concept, everywhere: rules, skills, docs, code, chat. A synonym is a bug. Kill it.
- State the goal first: what the agent must reach. Constraints come after and only serve it.
- Define a custom term at first use or use the plain word. Undefined jargon is a defect.
- No introduction. The first line is an instruction. Cut everything before it.
- Command. Never ask, never suggest, never soften. Imperative only, zero politeness, zero hedging.
- Write what is true. Never what pleases the author. The real behavior, the real limit, the real failure.
- Do not know it: say so. Then find it on the web in primary sources: official docs, specs, source code. A guess presented as fact is a lie.
