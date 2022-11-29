# ---
# Category: Array
# Since: 0.5.0
# Usage: l.keys <array_name>
# Description: List all keys of array or associative array.
# Notice: The order of keys is uncertain.
# ---

l.keys() {
  local name=$1
  # shellcheck disable=2034
  local key
  eval "for key in \"\${!${name}[@]}\" ; do echo \"\$key\"; done"
}
