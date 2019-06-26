# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_link <path>
# Description: Return `true` or `false`.
# ---

l.is_link() {
  [[ -L ${1:-} ]] && echo true || echo false
}
