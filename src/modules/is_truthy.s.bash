# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_truthy.s <str>
# Description: zero number and string "true" should be truthy.
# Description: This function always echo `true` or `false` and exit code always be 0.
# Dependent: is_truthy
# ---

l.is_truthy.s() {
  l.is_truthy "${1:-}" && echo true || echo false
}
