# ---
# Category: Console
# Since: 0.1.0
# Usage: l.echo_array <array_name>
# Description: Print each values of array with newline.
# ---

l.echo_array() {
  eval "printf '%s\\n' \"\${${1}[@]:-}\""
}
