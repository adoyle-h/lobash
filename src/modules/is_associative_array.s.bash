# ---
# Category: Condition
# Since: 0.7.0
# Usage: l.is_associative_array.s <var_name>
# Description: When the variable is array or associative array, it prints `true`. Otherwise it prints `false`. And it always exit with code 0.
# Dependent: is_associative_array
# Notice: Only with bash 4.3, this function will echo `false` when the variable declared without initialization.
# Notice: Because `declare -p a` shows `declare: a: not found` when `declare -a a`. It's a bug in bash 4.3.
# ---

l.is_associative_array.s() {
  l.is_associative_array "$@" && echo true || echo false
}
