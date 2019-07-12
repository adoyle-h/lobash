# ---
# Category: Array
# Since: 0.1.0
# Usage: l.sort <array_name> [<sort-opts>]...
# Description: Sort an array. The `<sort-opts>` are options of sort command.
# ---

l.sort() {
  local array_name=$1
  shift
  eval "printf '%s\\n' \"\${${array_name}[@]:-}\" | sort \"\$@\""
}
