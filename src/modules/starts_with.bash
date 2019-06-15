# ---
# Category: String
# Since: 0.1.0
# Usage: l.starts_with <string> <match>
# Description: Return `true` or `false`. Check if a string starts with given match string.
# ---

l.starts_with() {
  [[ $2${1##"$2"} == "$1" ]] && echo true || echo false
}
