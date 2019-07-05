# ---
# Category: Array
# Since: 0.1.0
# Usage: l.sort <array_name> [<sort-opts>]...
# Description: Sort an array. The `<sort-opts>` are options of sort command.
# Bash: 4.3
# ---

l.sort() {
  local -n l_sort_arg1=$1
  shift
  printf '%s\n' "${l_sort_arg1[@]}" | sort "$@"
}
