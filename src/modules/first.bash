# ---
# Category: Collection
# Since: 0.1.0
# Usage: l.first <arg>...
# Description: It will return the value of arg1.
# ---

l.first() {
  printf '%s\n' "${*:1:1}"
}
