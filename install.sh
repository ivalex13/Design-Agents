#!/usr/bin/env bash
#
# Install (or update) the design agents into a target repo.
#
#   ./install.sh /path/to/your/product-repo
#
# Copies into the target:
#   .claude/agents/                  <- specialist subagent personas
#   .claude/skills/                  <- /design-team, /researcher, /product-designer, /content-designer
#   .claude/design-agents/foundations.md
#   design/DESIGN.md                 <- starter template, only if none exists (never overwritten)
#
# Re-run any time to pull the latest versions from this repo; everything except
# design/DESIGN.md is overwritten on update.

set -euo pipefail

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 /path/to/target-repo" >&2
  exit 1
fi

TARGET="$1"

if [[ ! -d "$TARGET" ]]; then
  echo "Error: target directory '$TARGET' does not exist." >&2
  exit 1
fi
if [[ ! -e "$TARGET/.git" ]]; then
  echo "Warning: '$TARGET' is not a git repository root — installing anyway." >&2
fi

echo "Installing design agents into $TARGET"

mkdir -p "$TARGET/.claude/agents" "$TARGET/.claude/skills" "$TARGET/.claude/design-agents"

cp "$SOURCE_DIR"/agents/*.md "$TARGET/.claude/agents/"
echo "  ✓ agents  -> .claude/agents/ ($(ls "$SOURCE_DIR"/agents/*.md | wc -l | tr -d ' ') personas)"

for skill in "$SOURCE_DIR"/skills/*/; do
  name="$(basename "$skill")"
  mkdir -p "$TARGET/.claude/skills/$name"
  cp -R "$skill". "$TARGET/.claude/skills/$name/"
done
echo "  ✓ skills  -> .claude/skills/ ($(ls -d "$SOURCE_DIR"/skills/*/ | wc -l | tr -d ' ') skills)"

cp "$SOURCE_DIR/shared/foundations.md" "$TARGET/.claude/design-agents/foundations.md"
echo "  ✓ shared  -> .claude/design-agents/foundations.md"

if [[ -f "$TARGET/design/DESIGN.md" || -f "$TARGET/DESIGN.md" ]]; then
  echo "  - DESIGN.md already exists — left untouched"
else
  mkdir -p "$TARGET/design"
  cp "$SOURCE_DIR/templates/DESIGN.md" "$TARGET/design/DESIGN.md"
  echo "  ✓ seeded design/DESIGN.md from template — fill it in for this product"
fi

echo
echo "Done. In the target repo, try:  /design-team <your request>"
echo "Update later by re-running this script; design/DESIGN.md is never overwritten."
