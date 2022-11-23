# ---
# Category: Condition
# Since: 0.3.1
# Usage: l.end_with <string> <match>
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# ---

l.end_with() {
  [[ $1 =~ "$2"$ ]]
}
