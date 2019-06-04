# ---
# Category: Condition
# Since: 0.1.0
# Usage: not <command>
# ---

l.not() {
  local condition="$1"
  if [[ $condition == true ]]; then
    echo false;
  elif [[ $condition == false ]]; then
    echo true
  else
    return 2
  fi
}
