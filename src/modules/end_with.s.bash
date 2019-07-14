# ---
# Category: Condition
# Since: 0.3.1
# Usage: l.end_with.s <string> <match>
# Description: This function always echo `true` or `false` and exit code always be 0.
# Dependent: end_with
# ---

l.end_with.s() {
  l.end_with "$@" && echo true || echo false
}
