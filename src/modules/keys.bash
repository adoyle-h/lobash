# ---
# Category: Array
# Since: 0.5.0
# Usage: l.keys <array_name>
# Description: List all keys of array or associative array.
# Notice: The order of keys is uncertain.
# ---

l.keys() {
  # shellcheck disable=2034
  local _key_
  eval "for _key_ in \"\${!${1}[@]}\" ; do echo \"\$_key_\"; done"
}
