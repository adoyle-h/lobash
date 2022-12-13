# ---
# Category: Array
# Since: 0.1.0
# Usage: l.last <array_name>
# Description: Return the last value of array.
# ---

l.last() {
  eval "[[ \${#${1}[@]} == 0 ]] && echo '' || printf '%s\\n' \"\${${1}[@]: -1:1}\""
}
