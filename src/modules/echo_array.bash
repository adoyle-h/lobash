# ---
# Category: Console
# Since: 0.1.0
# Usage: l.echo_array <array_name>
# Description: Print each values of array with newline.
# ---

l.echo_array() {
  local array_name=$1
  eval "printf '%s\\n' \"\${${array_name}[@]:-}\""
}
