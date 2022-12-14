# ---
# Category: Array
# Since: next
# Usage: l.each <array> <fn>
# Usage: l.read_array out < <(l.each <array> <fn>)
# Description: Iterates over elements of array and invokes function for each element.
# Description: The function is invoked with two arguments: (value, index|key).
# Description: `<array>` must be the array name. `<fn>` must be the function name.
# Description: You can use `l.read_array` to create an array with l.each while `<fn>` printing new value.
# Notice: For associative array, the order of keys is uncertain.
# ---

l.each() {
  # shellcheck disable=2034
  local _key_
  eval "for _key_ in \"\${!$1[@]}\"; do ${2} \"\${$1[\"\$_key_\"]}\" \"\$_key_\"; done"
}
