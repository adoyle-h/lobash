# ---
# Category: Condition
# Since: 0.3.0
# Usage: l.is_executable.s <path>
# Description: Similar to `[[ -x ]]`
# Description: This function always echo `true` or `false` and exit code always be 0.
# ---

l.is_executable.s() {
  [[ -x ${1:-} ]] && echo true || echo false
}
