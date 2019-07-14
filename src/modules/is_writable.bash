# ---
# Category: Condition
# Since: 0.3.0
# Usage: l.is_writable <path>
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# ---

l.is_writable() {
  [[ -w ${1:-} ]]
}
