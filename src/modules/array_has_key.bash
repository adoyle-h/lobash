# ---
# Category: Array
# Since: next
# Usage: l.array_has_key <array_name> <key_name>
# Description: Check key whether defined in array or associative array.
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# ---

l.array_has_key() {
  eval "[[ \${$1[$2]+_} == _ ]]"
}
