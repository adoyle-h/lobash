# ---
# Category: Condition
# Since: 0.5.0
# Bash: 4.0
# Usage: l.is_exported <var_name>
# Description: Check whether a shell variable is exported.
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# Notice: Only with bash 4.3, this function return 1 when the exported variable declared without initialization.
# Notice: Because `declare -p a` shows `declare: a: not found` when `declare -a a`. It's a bug in bash 4.3.
# ---

l.is_exported() {
  local s
  if s=$(declare -p "$1" 2>/dev/null) ;then
    s=$(echo "$s" | sed -E 's/^declare ([-a-zA-Z]+) .+/\1/')
    if [[ $s == *x* ]]; then
      return 0
    else
      return 1
    fi
  else
    return 1
  fi
}
