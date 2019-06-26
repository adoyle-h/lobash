# ---
# Category: String
# Since: 0.1.0
# Usage: l.trim_start <string> [<chars>=[[:space:]]]
# Description: Remove leading whitespace or specified characters from string.
# ---

l.trim_start() {
  local str=${1:-}
  if (( $# < 2 )); then
    # https://stackoverflow.com/a/3352015
    printf '%s\n' "${str#"${str%%[![:space:]]*}"}"
  else
    printf '%s\n' "${str##$2}"
  fi
}
