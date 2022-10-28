# ---
# Category: Condition
# Since: 0.5.0
# Bash: 4.0
# Dependent: is_undefined
# Usage: l.is_exported <var_name>
# Description: Check whether a shell variable is exported.
# Description: Return 0 (true) or 1 (false). This function should never throw exception error.
# ---

l.is_exported() {
  if l.is_undefined "$1"; then
    return 1
  fi

  if [[ "${!1@a}" == *x* ]]; then
    return 0
  else
    return 1
  fi
}
