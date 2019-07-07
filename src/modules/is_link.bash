# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_link <path>
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# ---

l.is_link() {
  [[ -L ${1:-} ]]
}
