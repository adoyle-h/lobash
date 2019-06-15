# ---
# Category: String
# Since: 0.1.0
# Usage: l.upper_case <string>
# Usage: echo <string> | l.upper_case
# Description: Convert all characters of string to upper case.
# ---

# l.upper_case() {
#   tr '[:lower:]' '[:upper:]' <<< ${1:-}
# }

# CAVEAT: Requires bash 4+
l.upper_case() {
  local str
  if [[ -t 0 ]]; then
    str=$1
  else
    IFS='' read -r str
  fi
  printf '%s\n' "${str^^}"
}
