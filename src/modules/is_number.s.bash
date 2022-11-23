# ---
# Category: Condition
# Since: 0.3.0
# Usage: l.is_number.s <str>
# Description: This function always echo `true` or `false` and exit code always be 0.
# Dependent: is_number
# ---

l.is_number.s() {
  l.is_number "${1:-}" && echo true || echo false
}
