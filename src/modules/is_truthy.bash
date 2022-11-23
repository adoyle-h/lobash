# ---
# Category: Condition
# Since: 0.3.0
# Usage: l.is_truthy <str>
# Description: zero number and string "true" should be truthy.
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# ---

l.is_truthy() {
  [[ ${1:-} == true ]] || [[ ${1:-} == 0 ]]
}
