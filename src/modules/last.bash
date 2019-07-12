# ---
# Category: Array
# Since: 0.1.0
# Usage: l.last <array_name>
# Description: Return the last value of array.
# ---

l.last() {
  local array_name=$1
  eval "[[ \${#${array_name}[@]} == 0 ]] && echo '' || printf '%s\\n' \"\${${array_name}[@]: -1:1}\""
}
