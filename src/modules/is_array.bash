# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.is_array <var_name>
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# ---

l.is_array() {
  [[ -z ${1:-} ]] && return 1

  local str
  str=$(declare -p -- "$1" 2>/dev/null || true)
  [[ -z $str ]] && return 1

  local start="declare -a "
  [[ $start${str##"$start"} == "$str" ]]
}
