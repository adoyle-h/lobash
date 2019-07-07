# ---
# Category: String
# Since: 0.1.0
# Usage: l.join <array_name> [<delimiter>=,]
# Description: Convert all elements in array into a string separated by delimiter.
# Bash: 4.3
# ---

l.join() {
  local -n l_join_arg1=$1
  local _IFS=$IFS
  if [[ $# == 1 ]]; then
    IFS=,
  else
    IFS=${2}
  fi
  printf '%s\n' "${l_join_arg1[*]:-}"
  IFS=$_IFS
}
