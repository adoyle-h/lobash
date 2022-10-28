# ---
# Category: Array
# Since: 0.5.0
# Usage: l.keys <array_name>
# Description: List all keys of array or associative array. The order of keys is uncertain.
# ---

l.keys() {
  local name=$1
  eval "for key in \"\${!${name}[@]}\" ; do echo \"\$key\"; done"
}
