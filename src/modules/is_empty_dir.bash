# ---
# Category: Condition
# Since: next-patch
# Usage: l.is_empty_dir <path>
# Description: Test `<path>` is whether a empty directory or not. If directory not found, it returns false.
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# ---

l.is_empty_dir() {
  [[ -d ${1:-} ]] && [[ -z $(ls -A "${1:-}") ]]
}
