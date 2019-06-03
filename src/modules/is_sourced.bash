# ---
# Category: Condition
# Since: 0.1.0
# USAGE: l.is_sourced
# ---

l.is_sourced() {
  [[ "${BASH_SOURCE[0]}" == "${0}" ]] && echo true || echo false
}
