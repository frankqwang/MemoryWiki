#!/bin/bash
set -e

# sync.sh - Sync the canonical memory-wiki skill to installed agent skill directories.
#
# Run this from the vault root or directly from _skills/memory-wiki/ after
# changing SKILL.md or the templates. It replaces the installed copies with the
# canonical version in this directory.

SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"

# Default target locations. Override by setting TARGETS yourself, or edit this list.
DEFAULT_TARGETS=(
  "$HOME/.codex/skills/memory-wiki"
  "$HOME/temp/kimi-code/.agents/skills/memory-wiki"
)

TARGETS=("${TARGETS[@]:-${DEFAULT_TARGETS[@]}}")

if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
  echo "Usage: $0 [target-dir ...]"
  echo ""
  echo "Syncs the canonical memory-wiki skill from:"
  echo "  $SOURCE_DIR"
  echo "to each installed agent skill directory."
  echo ""
  echo "Default targets:"
  for target in "${DEFAULT_TARGETS[@]}"; do
    echo "  $target"
  done
  exit 0
fi

if [[ $# -gt 0 ]]; then
  TARGETS=("$@")
fi

for target in "${TARGETS[@]}"; do
  if [[ "$target" == "$SOURCE_DIR" ]]; then
    echo "Skipping source directory: $target"
    continue
  fi

  echo "Syncing to $target"
  rm -rf "$target"
  mkdir -p "$(dirname "$target")"
  cp -r "$SOURCE_DIR" "$target"
done

echo "Done. Synced ${#TARGETS[@]} skill copy(ies)."
