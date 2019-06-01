# ---
# Category: Collection
# Since: 0.1.0
# ---

# Usage: last arg1 arg2 ... argN
# It will return the value of arg1.
l.first() {
  echo "${*:1:1}"
}
