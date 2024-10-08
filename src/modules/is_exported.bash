# ---
# Category: Condition
# Since: 0.5.0
# Bash: 4.0
# Usage: l.is_exported <var_name>
# Description: Check whether a shell variable is exported.
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# Notice: Only with bash 4.3, this function return 1 when the exported variable declared without initialization.
# Notice: Because `declare -p a` shows `declare: a: not found` when `declare -a a`. It's a bug in bash 4.3.
# Notice: In bash 4.0~4.3, when `export <var>` without initialization, is_exported will return false. Because `declare -p <var>` will print "not found". It's a bug in Bash.
# Dependent: var_attrs
# ---

l.is_exported() {
  local attrs
  attrs=$(l.var_attrs "$1")
  [[ $attrs == *x* ]]
}
