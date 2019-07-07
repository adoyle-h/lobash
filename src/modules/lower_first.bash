# ---
# Category: String
# Since: 0.1.0
# Usage: l.lower_first <string>
# Description: Convert the first character of string to lower case.
# ---

l.lower_first() {
  local str=${1:-}
  printf '%s\n' "${str,}"
}
