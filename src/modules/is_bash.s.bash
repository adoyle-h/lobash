# ---
# Category: Condition
# Since: 0.3.0
# Usage: l.is_bash.s
# Description: This function always echo `true` or `false` and exit code always be 0.
# ---

l.is_bash.s() {
  _lobash.is_bash && echo true || echo false
}
