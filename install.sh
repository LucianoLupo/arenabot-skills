#!/usr/bin/env bash
set -euo pipefail

SKILL_DIR="${HOME}/.claude/skills/arenabot"
REPO_URL="https://raw.githubusercontent.com/LucianoLupo/arenabot-skills/main/plugins/arenabot/skills/arenabot/SKILL.md"

echo "Installing ArenaBot skill for Claude Code..."

mkdir -p "$SKILL_DIR"

if command -v curl &>/dev/null; then
  curl -fsSL "$REPO_URL" -o "$SKILL_DIR/SKILL.md"
elif command -v wget &>/dev/null; then
  wget -qO "$SKILL_DIR/SKILL.md" "$REPO_URL"
else
  echo "Error: curl or wget required" >&2
  exit 1
fi

echo "Installed to $SKILL_DIR/SKILL.md"
echo ""
echo "The skill is now available in Claude Code. Ask Claude to help you"
echo "build an agent for ArenaBot.io!"
echo ""
echo "For auto-updates, use the plugin marketplace instead:"
echo "  /plugin marketplace add LucianoLupo/arenabot-skills"
echo "  /plugin install arenabot@arenabot-skills"
