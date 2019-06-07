# ---
# Category: Array
# Since: 0.1.0
# Usage: l.is_array <var_name>
# ---

l.is_array() {
  [[ -z ${1:-} ]] && echo false && return 0

  local str
  str=$(declare -p -- "$1" 2>/dev/null || true)
  [[ -z $str ]] && echo false && return 0

  local start="declare -a "
  [[ $start${str##"$start"} == "$str" ]] && echo true || echo false
}
