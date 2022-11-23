# ---
# Category: Condition
# Since: 0.5.0
# Usage: l.is_function.s <var_name>
# Description: Detect `<var_name>` is whether a function or not.
# Description: This function always echo `true` or `false` and exit code always be 0.
# ---

l.is_function.s() {
  [[ $(type -t "${1:-}") == function ]] && echo true || echo false
}
