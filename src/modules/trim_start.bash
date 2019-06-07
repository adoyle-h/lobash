# ---
# Category: String
# Since: 0.1.0
# Usage: l.trim_start <string>
# ---

l.trim_start() {
  [[ $# -eq 0 ]] && echo "Missing argument" >&2 && return 3

  if [[ $# -eq 1 ]]; then
    printf '%s\n' "${1#"${1%%[![:space:]]*}"}"
  else
    printf '%s\n' "${1##$2}"
  fi
}
