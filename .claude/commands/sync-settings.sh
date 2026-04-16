#!/bin/bash
# Syncs ~/.claude/settings.json (base) to org config dirs.
# If settings.overlay.json exists in a target, merges org-specific
# permissions and plugins on top of the base config.
# Without an overlay, the target gets a straight copy of the base.
#
# Usage: bash ~/.claude/commands/sync-settings.sh

set -euo pipefail

BASE="$HOME/.claude/settings.json"
TARGETS=(
  "$HOME/dev/.claude"
  "$HOME/dev/bsky/.claude"
  "$HOME/dev/seats.aero/.claude"
)

if ! command -v jq &>/dev/null; then
  echo "error: jq is required" >&2
  exit 1
fi

if [[ ! -f "$BASE" ]]; then
  echo "error: base settings not found at $BASE" >&2
  exit 1
fi

for dir in "${TARGETS[@]}"; do
  if [[ ! -d "$dir" ]]; then
    echo "skip: $dir (directory not found)"
    continue
  fi

  overlay="$dir/settings.overlay.json"
  out="$dir/settings.json"

  # Skip if already symlinked to the base
  if [[ -L "$out" ]]; then
    echo "skip: $out (symlink to base)"
    continue
  fi

  if [[ -f "$overlay" ]]; then
    jq -s '
      .[0] as $base | .[1] as $over |
      $base * {
        permissions: ($base.permissions * {
          allow: (($base.permissions.allow // []) + ($over.permissions.allow // []) | unique),
          deny: (($base.permissions.deny // []) + ($over.permissions.deny // []) | unique)
        }),
        enabledPlugins: (($base.enabledPlugins // {}) * ($over.enabledPlugins // {}))
      }
    ' "$BASE" "$overlay" > "${out}.tmp" && mv "${out}.tmp" "$out"
    echo "synced: $out (with overlay)"
  else
    cp "$BASE" "$out"
    echo "synced: $out (base copy)"
  fi
done
