# ---
# Category: String
# Since: 0.1.0
# Usage: l.lower_case <string>
# Usage: echo <string> | l.lower_case
# ---

# l.lower_case() {
#   tr '[:upper:]' '[:lower:]' <<< ${1:-}
# }

# CAVEAT: Requires bash 4+
l.lower_case() {
  local str
  if [[ -t 0 ]]; then
    str=$1
  else
    IFS='' read -r str
  fi

  printf '%s\n' "${str,,}"
}
