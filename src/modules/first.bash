# ---
# Category: Collection
# Since: 0.1.0
# Usage: l.first <arg1> <arg2> [...argN]
# Description: It will return the value of arg1.
# ---

l.first() {
  printf '%s\n' "${*:1:1}"
}
