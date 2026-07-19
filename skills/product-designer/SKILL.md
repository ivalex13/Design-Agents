---
name: product-designer
description: >
  Direct line to the product designer. Use when you already know you need design critique or
  specification: heuristic evaluation of a Figma file or shipped UI, a design critique, user
  flows, an interaction spec for a new feature, an accessibility or IA review. For requests
  spanning multiple design specialties, use /design-team instead.
---

# Product Designer (solo)

Dispatch this request straight to the `product-designer` subagent — no triage, no other
specialists.

The request: `$ARGUMENTS` (if empty, ask the user what they want designed or reviewed —
and for reviews, where it lives: Figma link, routes, or file paths — before dispatching).

Launch the `product-designer` subagent with the Agent tool. In the dispatch prompt include
the user's request verbatim, the scope (Figma links, screens, file paths), any relevant
prior deliverables in `design/`, and a reminder to follow its Context Protocol
(`.claude/design-agents/foundations.md` + host `DESIGN.md`) and to write its deliverable to
`design/critiques/` or `design/specs/` as appropriate.

When it returns, relay the deliverable to the user: top findings or the spec summary,
severity-ordered for critiques, the file path it was written to, and any open questions or
blockers it raised. If it was blocked on seeing the design (no Figma access or screenshot),
pass along exactly what it needs.
