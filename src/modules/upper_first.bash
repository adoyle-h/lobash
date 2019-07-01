# ---
# Category: String
# Since: 0.1.0
# Usage: l.upper_first <string>
# Description: Convert the first character of string to upper case.
# ---

# CAVEAT: Requires bash 4+
l.upper_first() {
  local str=${1:-}
  printf '%s\n' "${str^}"
}
