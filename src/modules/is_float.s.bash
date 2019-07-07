# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_float.s <str>
# Description: This function always echo `true` or `false` and exit code always be 0.
# Dependent: is_float
# ---

l.is_float.s() {
  l.is_float "${1:-}" && echo true || echo false
}
