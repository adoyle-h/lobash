# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_writable.s <path>
# Description: This function always echo `true` or `false` and exit code always be 0.
# ---

l.is_writable.s() {
  [[ -w ${1:-} ]] && echo true || echo false
}
