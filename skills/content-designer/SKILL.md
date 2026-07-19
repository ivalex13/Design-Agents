---
name: content-designer
description: >
  Direct line to the content designer. Use when you already know the work is words: UX copy
  review or rewrites, microcopy for a new feature, an error message audit, voice & tone
  consistency checks, terminology cleanup. For requests spanning multiple design
  specialties, use /design-team instead.
---

# Content Designer (solo)

Dispatch this request straight to the `content-designer` subagent — no triage, no other
specialists.

The request: `$ARGUMENTS` (if empty, ask the user what copy needs work and where it lives —
screens, features, or file paths — before dispatching).

Launch the `content-designer` subagent with the Agent tool. In the dispatch prompt include
the user's request verbatim, the scope (features, screens, string files or paths if known),
whether they want a review or applied changes to the strings in code, and a reminder to
follow its Context Protocol (`.claude/design-agents/foundations.md` + host `DESIGN.md`,
especially Voice & tone) and to write its deliverable to `design/content/`.

When it returns, relay the deliverable to the user: the highest-impact fixes, the
before/after highlights, the file path it was written to, and any voice or terminology
decisions it flagged for a human to ratify.
