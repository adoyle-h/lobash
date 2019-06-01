# ---
# Category: Collection
# Since: 0.1.0
# ---

# Usage: last arg1 arg2 ... argN
# It will return the value of argN.
l.last() {
  printf '%s\n' "${*: -1:1}"
}
