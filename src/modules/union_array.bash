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

  eval "for l_union_array_item in \"\${${1}[@]}\"; do _l.union_array; done || true"

  if (( $# > 1 )); then
    eval "for l_union_array_item in \"\${${2}[@]}\"; do _l.union_array; done || true"
  fi

  l.echo_array l_union_array_arr
}
