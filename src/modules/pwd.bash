# ---
# Category: Path
# Since: 0.1.0
# Usage: l.pwd
# Description: Return the current working directory as set by the cd builtin.
# ---

l.pwd() {
  printf '%s\n' "$PWD"
}
