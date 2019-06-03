# ---
# Category: String
# Since: 0.1.0
# Usage: l.lower_case <string>
# ---

# l.lower_case() {
#   tr '[:upper:]' '[:lower:]' <<< ${1:-}
# }

# CAVEAT: Requires bash 4+
l.lower_case() {
  printf '%s\n' "${1,,}"
}
