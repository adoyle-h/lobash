# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_readable <path>
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# ---

l.is_readable() {
  [[ -r ${1:-} ]]
}
