# ---
# Category: String
# Since: 0.1.0
# Usage: l.upper_case <string>
# Description: Convert all characters of string to upper case.
# ---

# An alternative for Bash 3.x
# l.upper_case() {
#   tr '[:lower:]' '[:upper:]' <<< ${1:-}
# }

l.upper_case() {
  local str=${1:-}
  printf '%s\n' "${str^^}"
}
