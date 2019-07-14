# ---
# Category: Condition
# Since: 0.3.0
# Usage: l.is_number <str>
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# ---

l.is_number() {
  [[ ${1:-} =~ ^[-+]?[0-9]+(.[0-9]+)?$ ]]
}
