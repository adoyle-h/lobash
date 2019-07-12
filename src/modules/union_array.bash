# ---
# Category: Array
# Since: 0.1.0
# Usage: l.union_array <array_name_1> [<array_name_2>]
# Dependent: echo_array
# Description: Create an array of unique values from all given arrays.
# ---

_l.union_array() {
  if [[ -z ${l_union_array_map[$l_union_array_item]:-} ]]; then
    l_union_array_arr+=("$l_union_array_item")
    l_union_array_map["$l_union_array_item"]=1
  fi
}

l.union_array() {
  local -A l_union_array_map
  local l_union_array_item
  local -a l_union_array_arr

  local array_arr1=$1
  eval "for l_union_array_item in \"\${${array_arr1}[@]}\"; do _l.union_array; done || true"

  if (( $# > 1 )); then
    local array_arr2=$2
    eval "for l_union_array_item in \"\${${array_arr2}[@]}\"; do _l.union_array; done || true"
  fi

  l.echo_array l_union_array_arr
}
