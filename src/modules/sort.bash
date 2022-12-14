# ---
# Category: Array
# Since: 0.1.0
# Usage: l.sort <array_name> [<sort-opts>]...
# Description: Print a new sorted array with linux "sort" command.
# Description: The `<sort-opts>` are options of "sort" command.
# ---

l.sort() {
  local _array_name_=$1
  shift
  eval "printf '%s\\n' \"\${${_array_name_}[@]:-}\" | sort \"\$@\""
}
