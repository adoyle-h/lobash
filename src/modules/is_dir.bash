# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_dir <path>
# Description: Detect `<path>` is whether a directory or not.
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# ---

l.is_dir() {
  [[ -d ${1:-} ]]
}
