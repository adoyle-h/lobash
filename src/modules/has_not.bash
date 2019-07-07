# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.has_not <condition> <what>
# Description: Opposite to l.has
# Dependent: has
# ---

l.has_not() {
  local e=false
  [[ $- =~ e ]] && e=true
  set +e
  l.has "${@}"
  local result=$?
  [[ $e == true ]] && set -e

  if [[ $result == 0 ]]; then
    return 1
  elif [[ $result == 1 ]]; then
    return 0
  else
    return $result
  fi
}
