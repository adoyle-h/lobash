# ---
# Category: Path
# Since: 0.1.0
# Usage: l.basename <path>
# Description: Alternative to basename command. It much faster because using shell parameter expansion.
# ---

l.basename() {
  : "${1%/}"
  printf '%s\n' "${_##*/}"
}
