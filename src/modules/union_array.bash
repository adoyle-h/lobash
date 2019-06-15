# ---
# Category: Array
# Since: 0.1.0
# Usage: l.union_array <var_name>...
# Description: Create an array of unique values from all given arrays.
# ---

l.union_array() {
  local -n l_union_array_a=$1
  local -n l_union_array_b=$2
  local -a arr;
  arr=("${l_union_array_a[@]}" "${l_union_array_b[@]}")
  echo "${arr[@]}"
}
