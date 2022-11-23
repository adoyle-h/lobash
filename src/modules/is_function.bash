# ---
# Category: Condition
# Since: 0.5.0
# Usage: l.is_function <var_name>
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# ---

l.is_function() {
  [[ $(type -t "${1:-}") == function ]]
}
