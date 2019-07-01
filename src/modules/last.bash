# ---
# Category: Array
# Since: 0.1.0
# Usage: l.last <array_name>
# Description: Return the last value of array.
# ---

l.last() {
  local -n l_last_arg1=$1
  printf '%s\n' "${l_last_arg1[@]: -1:1}"
}
