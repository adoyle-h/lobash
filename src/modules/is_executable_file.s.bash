# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_executable_file.s <path>
# Description: Similar to `l.is_executable`. But if `<path>` is directory it will return false.
# Description: This function always echo `true` or `false` and exit code always be 0.
# Dependent: is_executable_file
# ---

l.is_executable_file.s() {
  l.is_executable_file "${1:-}" && echo true || echo false
}
