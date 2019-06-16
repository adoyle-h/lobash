# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_sourced
# Description: Detect current file whether is sourced or not.
# Status: not work
# ---

l.is_sourced() {
  [[ "$_" == "${0}" ]] && echo true || echo false
}
