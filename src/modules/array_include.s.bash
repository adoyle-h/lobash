# ---
# Category: Array
# Since: 0.1.0
# Usage: l.array_include.s <array_name> <match>
# Description: This function always echo `true` or `false` and exit code always be 0.
# Bash: 4.3
# ---

l.array_include.s() {
  local -n l_array_include_arg_array=$1
  (( ${#l_array_include_arg_array[@]} == 0 )) && echo false && return

  local match="$2"
  local e
  shift
  for e in "${l_array_include_arg_array[@]}"; do
    [[ "$e" == "$match" ]] && echo true && return 0;
  done

  echo false
}
