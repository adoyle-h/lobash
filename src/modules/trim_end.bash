# ---
# Category: String
# Since: 0.1.0
# Usage: l.trim_end <string>
# ---

l.trim_end() {
  [[ $# -eq 0 ]] && return 2

  if [[ $# -eq 1 ]]; then
    printf '%s\n' "${1%"${1##*[![:space:]]}"}"
  else
    printf '%s\n' "${1%%$2}"
  fi
}
