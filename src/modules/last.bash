# ---
# Category: Collection
# Since: 0.1.0
# Usage: l.last <array_name>
# Description: It will return the value of argN.
# ---

l.last() {
  local -n l_last_arg1=$1
  printf '%s\n' "${l_last_arg1[@]: -1:1}"
}
