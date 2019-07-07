# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_integer.s <str>
# Description: This function always echo `true` or `false` and exit code always be 0.
# Dependent: is_integer
# ---

l.is_integer.s() {
  l.is_integer "${1:-}" && echo true || echo false
}
