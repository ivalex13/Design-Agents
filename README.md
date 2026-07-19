# Design Agents

A small AI design team for Claude Code: three specialist agents and a lead that
coordinates them, installable into any product repo.

| Entry point | Who answers | What for |
|---|---|---|
| `/design-team <request>` | **Design lead** | Any design request. Triages, dispatches the right specialists, synthesizes one answer. The default door. |
| `/researcher <request>` | **Researcher** | Research plans, interview guides, competitive/desk research, synthesis, personas/JTBD. |
| `/product-designer <request>` | **Product designer** | Critiques of Figma files or shipped UI, heuristic evaluations, user flows, interaction specs, accessibility/IA reviews. |
| `/content-designer <request>` | **Content designer** | UX copy review/rewrites, microcopy, error message audits, voice & tone, terminology. |

The expertise lives in the subagent personas (`agents/`); the solo skills are thin wrappers
around the same specialists the lead dispatches — one source of truth per specialist.

## Install into a product repo

```bash
git clone <this-repo>
./Design-Agents/install.sh /path/to/your/product-repo
```

This copies into the target repo:

- `.claude/agents/` — the three specialist personas
- `.claude/skills/` — the four slash commands
- `.claude/design-agents/foundations.md` — shared design philosophy all agents follow
- `design/DESIGN.md` — a starter principles file for *your* product (only if you don't
  already have one; never overwritten)

**Update:** pull this repo and re-run the script. Everything except `design/DESIGN.md` is
refreshed. This repo is the canonical source — improve the agents here, not in per-repo
copies.

## How it works in a product repo

- **Deliverables** are Markdown files committed under `design/`:
  `design/research/`, `design/critiques/`, `design/specs/`, `design/content/`.
- **Per-product principles:** every agent reads `design/DESIGN.md` before working and defers
  to it over the shared foundations. Fill in the seeded template — product register, voice,
  design principles, standing decisions — and the whole team calibrates to your product.
- **Integrations:** the product designer reads Figma files via the Figma MCP server (connect
  it in the host repo for Figma critique), the researcher uses web search for desk research,
  and all agents read the host repo's code — the content designer works on your actual UI
  strings.

## Repo layout

```
agents/               # specialist subagent personas (the real expertise)
skills/               # /design-team (lead) + thin solo wrappers
shared/foundations.md # shared philosophy, critique standards, deliverable conventions
templates/DESIGN.md   # starter per-product principles file
install.sh            # copy/update everything into a target repo
```

## Extending the team

To add a specialist (e.g. a design-system agent):

1. Add `agents/<name>.md` — persona, method, deliverable formats (follow the existing ones).
2. Add `skills/<name>/SKILL.md` — thin solo wrapper (copy an existing one).
3. Add the specialist to the dispatch table in `skills/design-team/SKILL.md`.
4. Re-run `install.sh` in each product repo.
