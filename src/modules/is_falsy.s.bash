# ---
# Category: Condition
# Since: 0.3.0
# Usage: l.is_falsy.s <var>
# Description: nonzero number and string "false" should be falsy.
# Description: This function always echo `true` or `false` and exit code always be 0.
# Dependent: is_falsy
# ---

l.is_falsy.s() {
  l.is_falsy "${1:-}" && echo true || echo false
}
