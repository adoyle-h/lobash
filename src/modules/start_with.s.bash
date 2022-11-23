# ---
# Category: Condition
# Since: 0.3.1
# Usage: l.start_with.s <string> <match>
# Description: Check if a string starts with given match string.
# Description: This function always echo `true` or `false` and exit code always be 0.
# Dependent: start_with
# ---

l.start_with.s() {
  l.start_with "$@" && echo true || echo false
}
