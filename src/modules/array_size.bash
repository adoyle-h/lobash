# ---
# Category: Array
# Since: 0.7.0
# Usage: l.array_size <array_name>
# Description: Return the actual size of array and associative array
# Description: For `declare -A array=([test]='')`, the `${#array[@]}` is 0, because bash excludes the null value.
# ---

l.array_size() {
  # shellcheck disable=2034
  local _size_=0 _key_
  eval "for _key_ in \"\${!${1}[@]}\" ; do _size_=\$((_size_ + 1)); done"
  echo "$_size_"
}
