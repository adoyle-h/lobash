# ---
# Category: Condition
# Since: 0.3.0
# Usage: l.is_array.s <var_name>
# Description: This function always echo `true` or `false` and exit code always be 0.
# ---

l.is_array.s() {
  [[ -z ${1:-} ]] && echo false && return 0

  [[ $(declare -p "$1" 2>/dev/null) =~ ^"declare -a $1=" ]] && echo true || echo false
}
