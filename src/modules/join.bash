# ---
# Category: String
# Since: 0.1.0
# Usage: l.join <array_name> [<delimiter>=,]
# Description: Convert all elements in array into a string separated by delimiter.
# ---

l.join() {
  if [[ $# == 1 ]]; then
    local IFS=,
  else
    local IFS=${2}
  fi
  eval "printf '%s\\n' \"\${${1}[*]:-}\""
}
