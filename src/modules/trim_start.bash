# ---
# Category: String
# Since: 0.1.0
# Usage: l.trim_start <string>
# Usage: echo <string> | l.trim_start
# Description: Remove leading whitespace or specified characters from string.
# ---

l.trim_start() {
  if [[ -t 0 ]]; then
    local str=${1:-}
    if [[ $# == 2 ]]; then
      printf '%s\n' "${str##$2}"
    else
      # https://stackoverflow.com/a/3352015
      printf '%s\n' "${str#"${str%%[![:space:]]*}"}"
    fi
  else
    IFS='' read -r str
    if [[ $# == 1 ]]; then
      printf '%s\n' "${str##$1}"
    else
      printf '%s\n' "${str#"${str%%[![:space:]]*}"}"
    fi
  fi
}
