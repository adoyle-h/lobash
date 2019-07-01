# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_file <path>
# Description: Return `true` or `false`.
# ---

l.is_file() {
  [[ -f ${1:-} ]] && echo true || echo false
}
