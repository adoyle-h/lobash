# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_integer <str>
# Description: Return `true` or `false`.
# ---

l.is_integer() {
  [[ ${1:-} =~ ^[-+]?[0-9]+$ ]] && echo true || echo false
}
