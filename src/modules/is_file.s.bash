# ---
# Category: Condition
# Since: 0.3.0
# Usage: l.is_file.s <path>
# Description: This function always echo `true` or `false` and exit code always be 0.
# ---

l.is_file.s() {
  [[ -f ${1:-} ]] && echo true || echo false
}
