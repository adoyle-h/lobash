# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_number <str>
# Description: Return `true` or `false`.
# ---

l.is_number() {
  [[ ${1:-} =~ ^[-+]?[0-9]+(.[0-9]+)?$ ]] && echo true || echo false
}
