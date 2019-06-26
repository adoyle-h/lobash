# ---
# Category: String
# Since: 0.1.0
# Usage: l.lower_case <string>
# Description: Convert all characters of string to lower case.
# ---

# An alternative for Bash 3.x
# l.lower_case() {
#   tr '[:upper:]' '[:lower:]' <<< ${1:-}
# }

l.lower_case() {
  local str=${1:-}
  printf '%s\n' "${str,,}"
}
