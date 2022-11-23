# ---
# Category: Condition
# Since: 0.5.0
# Bash: 4.0
# Usage: l.is_undefined <var_name>
# Description: Check whether a shell variable is undefined.
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# ---

l.is_undefined() {
  if declare -p "$1" &>/dev/null ;then
    return 1
  else
    return 0
  fi
}
