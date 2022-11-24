# ---
# Category: Condition
# Since: 0.3.0
# Usage: l.is_array <var_name>
# Description: When the variable is array or associative array, it returns 0 (true). Otherwise it returns 1 (false). This function should never throw exception error.
# Notice: Only with bash 4.3, this function return 1 when the variable declared without initialization.
# Notice: Because `declare -p a` shows `declare: a: not found` when `declare -a a`. It's a bug in bash 4.3.
# ---

l.is_array() {
  [[ -z ${1:-} ]] && return 1

  local attrs
  # shellcheck disable=2207
  attrs=$(declare -p "$1" 2>/dev/null | sed -E "s/^declare -([-a-zA-Z]+) .+/\\1/" || true)

  # a: array
  # A: associate array
  if [[ ${attrs} =~ a|A ]]; then return 0; else return 1; fi
}
