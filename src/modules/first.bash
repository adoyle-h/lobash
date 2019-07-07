# ---
# Category: Array
# Since: 0.1.0
# Usage: l.first <array_name>
# Description: Return the first value of array.
# Bash: 4.3
# ---

l.first() {
  local -n l_first_arg1=$1
  printf '%s\n' "${l_first_arg1[@]:0:1}"
}
