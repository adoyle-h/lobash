# ---
# Category: Condition
# Since: 0.3.0
# Usage: l.is_array <var_name>
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# ---

l.is_array() {
  [[ -z ${1:-} ]] && return 1

  [[ $(declare -p "$1" 2>/dev/null) =~ ^"declare -a $1=" ]]
}
