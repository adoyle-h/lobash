# ---
# Category: Array
# Since: 0.1.0
# Usage: l.array_include <array_name> <match>
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# Bash: 4.3
# ---

l.array_include() {
  local -n l_array_include_arg_array=$1
  (( ${#l_array_include_arg_array[@]} == 0 )) && return 1

  local match="$2"
  local e
  shift
  for e in "${l_array_include_arg_array[@]}"; do
    [[ "$e" == "$match" ]] && return 0;
  done

  return 1
}
