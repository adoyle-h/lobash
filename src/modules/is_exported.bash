# ---
# Category: Condition
# Since: 0.5.0
# Bash: 4.0
# Usage: l.is_exported <var_name>
# Description: Check whether a shell variable is exported.
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# ---

l.is_exported() {
  local s
  if s=$(declare -p "$1" 2>/dev/null) ;then
    s=$(echo "$s" | sed -E 's/^declare ([-a-z]+) /\1/')
    if [[ $s == *x* ]]; then
      return 0
    else
      return 1
    fi
  else
    return 1
  fi
}
