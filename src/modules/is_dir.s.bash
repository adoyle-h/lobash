# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_dir.s <path>
# Description: Detect `<path>` is whether a directory or not.
# Description: This function always echo `true` or `false` and exit code always be 0.
# ---

l.is_dir.s() {
  [[ -d ${1:-} ]] && echo true || echo false
}
