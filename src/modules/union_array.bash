# ---
# Category: Array
# Since: 0.1.0
# Usage: l.union_array <var_name>...
# Status: not work
# Bash: 4.3.0
# ---

l.union_array() {
  local -n l_union_array_a=$1
  local -n l_union_array_b=$2
  local -a arr;
  arr=("${l_union_array_a[@]}" "${l_union_array_b[@]}")
  echo "${arr[@]}"
}
