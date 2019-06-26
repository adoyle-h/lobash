# ---
# Category: Condition
# Since: 0.1.0
# Dependent: is_integer
# Usage: l.is_false <var>
# Description: Return `true` or `false`.
# ---

l.is_false() {
  local r
  r=$(l.is_integer "${1:-}")

  if [[ $r == true ]]; then
    if [[ ${1:-} != 0 ]]; then
      echo true
    else
      echo false
    fi
  else
    if [[ ${1:-} == false ]]; then
      echo true
    else
      echo false
    fi
  fi
}
