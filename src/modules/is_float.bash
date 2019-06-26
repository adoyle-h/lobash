# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_float <str>
# Description: Return `true` or `false`.
# ---

l.is_float() {
  [[ ${1:-} =~ ^[-+]?[0-9]+([.][0-9]+)?$ ]] && echo true || echo false
}
