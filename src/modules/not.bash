# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.not <condition>
# Description: `<condition>` must be `true` or `false`. This function returns the opposite value.
# ---

l.not() {
  local condition="${1:-}"

  if [[ $condition == true ]]; then
    echo false;
  elif [[ $condition == false ]]; then
    echo true
  else
    echo "Invalid condition! It must be one of 'true' and 'false'. Current value=$condition" >&2
    return 3
  fi
}
