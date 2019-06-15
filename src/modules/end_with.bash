# ---
# Category: String
# Since: 0.1.0
# Usage: l.end_with <string> <match>
# ---

l.end_with() {
  [[ ${1%%"$2"}$2 == "$1" ]] && echo true || echo false
}
