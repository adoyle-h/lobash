# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_dir <var>
# ---

l.is_dir() {
  [[ -d $1 ]] && echo true || echo false
}
