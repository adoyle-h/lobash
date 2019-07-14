# ---
# Category: Condition
# Since: 0.3.1
# Usage: l.start_with <string> <match>
# Description: Check if a string starts with given match string.
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# ---

l.start_with() {
  [[ $2${1##"$2"} == "$1" ]]
}
