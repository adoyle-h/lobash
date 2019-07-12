# ---
# Category: String
# Since: 0.1.0
# Usage: l.join <array_name> [<delimiter>=,]
# Description: Convert all elements in array into a string separated by delimiter.
# ---

l.join() {
  local array_name=$1
  local _IFS=$IFS
  if [[ $# == 1 ]]; then
    IFS=,
  else
    IFS=${2}
  fi
  eval "printf '%s\\n' \"\${${array_name}[*]:-}\""
  IFS=$_IFS
}
