# ---
# Category: Array
# Since: 0.1.0
# Usage: l.array_include <array_name> <match>
# Bash: 4.3
# ---

l.array_include() {
  local -n l_array_include_arg_array=$1
  local match="$2"
  local e
  shift
  for e in "${l_array_include_arg_array[@]}"; do
    [[ "$e" == "$match" ]] && echo true && return 0;
  done

  echo false
}
