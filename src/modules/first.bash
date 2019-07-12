# ---
# Category: Array
# Since: 0.1.0
# Usage: l.first <array_name>
# Description: Return the first value of array.
# ---

l.first() {
  local array_name=$1
  eval "[[ \${#${array_name}[@]} == 0 ]] && echo '' || printf '%s\\n' \"\${${array_name}[@]:0:1}\""
}
