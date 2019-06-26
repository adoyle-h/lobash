# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_writeable <path>
# Description: Return `true` or `false`.
# ---

l.is_writeable() {
  [[ -w ${1:-} ]] && echo true || echo false
}
