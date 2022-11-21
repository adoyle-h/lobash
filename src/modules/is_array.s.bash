# ---
# Category: Condition
# Since: 0.3.0
# Usage: l.is_array.s <var_name>
# Description: This function always echo `true` or `false` and exit code always be 0.
# Dependent: is_array
# ---

l.is_array.s() {
  l.is_array "$@" && echo true || echo false
}
