#!/usr/bin/env bash
# Rename the plugin directory (currently: notion-flywheel) to a new name and update
# every reference in one shot. Run from the repo root:
#
#   bash scripts/rename-plugin.sh <new-name>
#
# <new-name> must be kebab-case (lowercase letters, digits, hyphens).
# Touches: plugins/<old> -> plugins/<new>, .claude-plugin/marketplace.json
# (plugin "name" + "source"), plugins/<new>/.claude-plugin/plugin.json ("name"),
# and README.md path references. The marketplace "name" (the catalog id, e.g.
# noah-notion-flywheel) is left alone — change it by hand if you want to.
set -euo pipefail

NEW="${1:-}"
if [ -z "$NEW" ]; then
  echo "usage: bash scripts/rename-plugin.sh <new-name>" >&2
  exit 1
fi
if ! printf '%s' "$NEW" | grep -Eq '^[a-z0-9]+(-[a-z0-9]+)*$'; then
  echo "error: <new-name> must be kebab-case (e.g. my-brain), got: $NEW" >&2
  exit 1
fi

# Derive the current plugin dir name (the single directory under plugins/).
OLD="$(ls -1 plugins | head -n1)"
if [ -z "$OLD" ] || [ ! -d "plugins/$OLD" ]; then
  echo "error: could not find a plugin directory under plugins/" >&2
  exit 1
fi
if [ "$OLD" = "$NEW" ]; then
  echo "nothing to do: plugin is already named '$NEW'"
  exit 0
fi

echo "Renaming plugin '$OLD' -> '$NEW'"

# 1. Move the directory (git mv keeps history; falls back to mv if not staged).
git mv "plugins/$OLD" "plugins/$NEW" 2>/dev/null || mv "plugins/$OLD" "plugins/$NEW"

# 2. Update references. Each replace is scoped so we never touch unrelated text
#    (e.g. the marketplace catalog name "noah-$OLD").
sed -i "s#\"source\": \"./plugins/$OLD\"#\"source\": \"./plugins/$NEW\"#g" .claude-plugin/marketplace.json
sed -i "s#\"name\": \"$OLD\"#\"name\": \"$NEW\"#g" .claude-plugin/marketplace.json
sed -i "s#\"name\": \"$OLD\"#\"name\": \"$NEW\"#g" "plugins/$NEW/.claude-plugin/plugin.json"
sed -i "s#plugins/$OLD#plugins/$NEW#g" README.md

echo "Done. Review the diff, then:"
echo "  - update the install command users run: ${NEW}@<marketplace-name>"
echo "  - 'claude plugin validate .' to confirm the manifest still parses"
echo "  - git add -A && git commit"
