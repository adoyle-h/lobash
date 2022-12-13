# ---
# Category: Array
# Since: 0.1.0
# Usage: l.first <array_name>
# Description: Return the first value of array.
# ---

l.first() {
  eval "[[ \${#${1}[@]} == 0 ]] && echo '' || printf '%s\\n' \"\${${1}[@]:0:1}\""
}
