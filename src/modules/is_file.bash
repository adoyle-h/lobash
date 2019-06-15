# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_file <var>
# ---

l.is_file() {
  [[ -f $1 ]] && echo true || echo false
}
