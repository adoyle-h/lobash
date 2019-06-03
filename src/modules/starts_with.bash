# ---
# Category: String
# Since: 0.1.0
# Usage: l.starts_with <string> <match>
# ---

l.starts_with() {
  [[ $2${1##"$2"} == "$1" ]] && echo true || echo false
}
