# ---
# Category: Condition
# Since: 0.1.0
# Usage: l.not <condition>
# ---

l.not() {
  if [[ -t 0 ]]; then
    local condition="${1:-}"
  else
    read -r condition
  fi

  if [[ $condition == true ]]; then
    echo false;
  elif [[ $condition == false ]]; then
    echo true
  else
    echo "Invalid condition! It must be one of 'true' and 'false'. Current value=$condition" >&2
    return 3
  fi
}
