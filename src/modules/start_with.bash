# ---
# Category: String
# Since: 0.1.0
# Usage: l.start_with <string> <match>
# Description: Return `true` or `false`. Check if a string starts with given match string.
# ---

l.start_with() {
  [[ $2${1##"$2"} == "$1" ]] && echo true || echo false
}
