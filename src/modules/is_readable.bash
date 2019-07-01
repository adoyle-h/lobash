# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_readable <path>
# Description: Return `true` or `false`.
# ---

l.is_readable() {
  [[ -r ${1:-} ]] && echo true || echo false
}
