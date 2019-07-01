# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_executable <path>
# Description: Similar to `[[ -x ]]`. Return `true` or `false`.
# ---

l.is_executable() {
  [[ -x ${1:-} ]] && echo true || echo false
}
