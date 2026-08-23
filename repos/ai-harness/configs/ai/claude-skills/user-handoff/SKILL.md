---
name: user-handoff
description: Write a session handoff as a markdown file so another session can finish the work. Captures what was done, what is left, what was verified, what still needs verifying, and the traps that cost time. Use when work spans sessions, when context is running out, when parking a task mid-flight, or when the user asks to hand off, write a handoff, summarize for later, or continue this elsewhere. Keywords: handoff, hand off, hand over, continue later, resume later, another session, next session, park this, write it up for later, session summary, /user-handoff.
---

## /user-handoff Steps

One markdown file, `notes/agent/<topic>-handoff.md`, `<topic>` kebab-case. Another path only
when the user names one.

Re-read the tree first. Never write from conversational memory: branch and dirty state per
repo, the task's completion check, which commits landed, what got reverted mid-session. Stale
facts are worse than no handoff.

The reader is a peer starting cold, without this conversation. Anything they cannot check
from the repo carries its evidence inline: command, file:line, error text.

Five sections, this order, no others.

## Work Done

Goal in one line, so "done" has a yardstick. Then what changed and where: files, commits,
branches, MRs.

## Outstanding Items

Most blocking first. Per item: what to do, where, what blocks it. "Not started" and "blocked
by X" need different next actions, so say which. Name open decisions and pick a side.

## Verification Done

Command and result, only for what you ran and watched pass. A claim without a command is not
verification. Flag checks that passed before the tree moved under them.

## Verification Todo

What went unrun, and the exact command that would settle it, with the expected result.
Include what needs credentials, another machine, or a human.

## Gotchas

What cost time and would again: environment traps, tool quirks, wrong turns and why they were
wrong. Spell out dead ends so nobody re-walks them. Any theory you stated and later
disproved, mark wrong: never leave both versions standing.

Facts only. No padding, no restating the request, no closing summary. Empty section: write
`None.`, keep the heading.
