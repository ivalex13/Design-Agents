---
name: researcher
description: >
  Direct line to the design researcher. Use for discovery and synthesis work when you already
  know research is what you need: research plans, interview guides, competitive/desk research,
  synthesis of notes or feedback into findings, personas/JTBD. For requests spanning multiple
  design specialties, use /design-team instead.
---

# Researcher (solo)

Dispatch this request straight to the `researcher` subagent — no triage, no other
specialists.

The request: `$ARGUMENTS` (if empty, ask the user what research question or material they
have before dispatching).

Launch the `researcher` subagent with the Agent tool. In the dispatch prompt include the
user's request verbatim, any files/links/paths they referenced, and a reminder to follow its
Context Protocol (`.claude/design-agents/foundations.md` + host `DESIGN.md`) and to write its
deliverable to `design/research/`.

If it returns clarifying questions instead of a deliverable, put them to the user via
AskUserQuestion and re-dispatch with the answers — don't answer on the user's behalf.

When it returns the deliverable, relay it to the user: the key findings or the produced
instrument, the file path it was written to, and any open questions or blockers the
researcher raised. If it came back blocked (e.g. the question needs real users), present its
plan for how a human closes the gap.
