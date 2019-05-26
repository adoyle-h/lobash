# ---
# Category: Collection
# Since: 0.1.0
# ---

# Usage: last arg1 arg2 ... argN
# It will return the value of argN.
last() {
  echo "${*: -1:1}"
}
