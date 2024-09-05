# ---
# Category: Variable
# Since: 0.7.0
# Usage: l.var_attrs <var_name>
# Description: Return the attributions of variable.
# Description: If variable undefined, return ''.
# Notice: Only with bash 4.3, this function return 1 when the variable declared without initialization.
# Notice: Because `declare -p a` shows `declare: a: not found` when `declare -a a`. It's a bug in bash 4.3.
# ---

l.var_attrs() {
  [[ -z ${1:-} ]] && return 1

  local attrs
  # shellcheck disable=2207
  attrs=$(declare -p "$1" 2>/dev/null || true)
  attrs=${attrs#* -}
  attrs=${attrs%% *}

  echo "${attrs#-}"
}
