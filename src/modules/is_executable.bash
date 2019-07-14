# ---
# Category: Condition
# Since: 0.3.0
# Usage: l.is_executable <path>
# Description: Similar to `[[ -x ]]`.
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# ---

l.is_executable() {
  [[ -x ${1:-} ]]
}
