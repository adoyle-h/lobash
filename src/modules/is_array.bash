# ---
# Category: Condition
# Since: 0.3.0
# Usage: l.is_array <var_name>
# Description: When the variable is array or associative array, it returns 0 (true). Otherwise it returns 1 (false). This function should never throw exception error.
# Notice: Only with bash 4.3, this function return 1 when the variable declared without initialization.
# Notice: Because `declare -p a` shows `declare: a: not found` when `declare -a a`. It's a bug in bash 4.3.
# Dependent: var_attrs
# ---

l.is_array() {
  [[ -z ${1:-} ]] && return 1

  local attrs
  attrs=$(l.var_attrs "$1")

  # a: array
  # A: associate array
  [[ ${attrs} =~ a|A ]]
}
