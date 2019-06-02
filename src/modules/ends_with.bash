# ---
# Category: String
# Since: 0.1.0
# Usage: l.ends_with <string> <match>
# ---

l.ends_with() {
  if [[ ${1%%"$2"}$2 == "$1" ]]; then
    echo true
  else
    echo false
  fi
}
