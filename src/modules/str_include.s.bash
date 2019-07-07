# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.str_include.s <string> <sub-string>
# Description: Return `true` or `false`. Check if a string includes given match string.
# Dependent: str_include
# ---

# shellcheck disable=SC2076

l.str_include.s() {
  l.str_include "$@" && echo true || echo false;
}
