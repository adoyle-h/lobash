# ---
# Category: Collection
# Since: 0.1.0
# Usage: l.last <arg>...
# Description: It will return the value of argN.
# ---

l.last() {
  printf '%s\n' "${*: -1:1}"
}
