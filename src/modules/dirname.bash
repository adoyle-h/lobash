# ---
# Category: Path
# Since: 0.1.0
# Usage: l.dirname <path>
# Description: Alternative to dirname command. It much faster because using shell parameter expansion.
# ---

l.dirname() {
  printf '%s\n' "${1%/*}"
}
